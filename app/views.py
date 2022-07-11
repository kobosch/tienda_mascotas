from ast import For
from cmath import e
from re import A
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User, Group, Permission
from datetime import datetime
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages
from django.http import HttpResponseRedirect
from .models import CATEGORIA, PRODUCTO, ESTADO_COMPRA, COMPRA, COMPRA_PRODUCTO, SUSCRITO
from django.views.generic.base import TemplateView
from django.utils.decorators import method_decorator
from functools import wraps
from rest_framework.views import APIView
from rest_framework.response import Response
import requests
import json
from django.core.mail import EmailMessage



def WebService(request,Path, Params, Method="GET", files=None):
    # url de la api
    url = "http://" + request.get_host() + "/"
    url = url+ Path
    # obtener la respuesta de la api enviando la url y los parametros
    if(Method == "GET"):
        if(Params is not None):
            url = url + "?"+Params
        response = requests.get(url)
    elif(Method == "POST"):
        response = requests.post(url, data=Params, files=files)
    elif(Method == "PUT"):
        response = requests.put(url, data=Params, files=files)
    elif(Method == "DELETE"):
        response = requests.delete(url, data=Params)

    if(response.status_code == 200):
        # convertir la respuesta a json
        data = json.loads(response.text)
        # retornar la respuesta
        return data
    else:
        return False



class TIPO_USUARIO_API(APIView):
    def get(self, request):
        tipos = Group.objects.all().values()
        return Response(tipos)

class CATEGORIAS_API(APIView):
    def get(self, request):
        categorias = CATEGORIA.objects.all().values()
        return Response(categorias)
    def post(self, request):
        if('nombre' in request.data):
            categoria = CATEGORIA(nombre=request.data['nombre'])
            categoria.save()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo crear la categoria"})

    #metodo para eliminar una categoria
    def delete(self, request):
        if('id' in request.data):
            categoria = CATEGORIA.objects.get(id=request.data['id'])
            categoria.delete()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo eliminar la categoria"})
    
    #metodo para actualizar una categoria
    def put(self, request):
        if('id' in request.data and 'nombre' in request.data):
            categoria = CATEGORIA.objects.get(id=request.data['id'])
            categoria.nombre = request.data['nombre']
            categoria.save()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo actualizar la categoria"})


class SUSCRIPCIONES_API(APIView):
    def get(self, request):
        if('idUsuario' in request.GET):
            try:
                UsuarioObj = User.objects.get(id=request.GET.get('idUsuario'))
                SUSCRITO.objects.get(usuario=UsuarioObj)
                #obtener largo de suscritos
                
                return Response({'suscrito': True})
            except SUSCRITO.DoesNotExist:
                return Response({"suscrito":False})
        else:
            suscritos = SUSCRITO.objects.all().values()
            return Response(suscritos)

    def post(self, request):
        if('idUsuario' in request.data):
            usuario = User.objects.get(id=request.data['idUsuario'])
            suscrito = SUSCRITO(usuario=usuario)
            suscrito.save()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo crear la suscripcion"})

    #metodo para eliminar una suscripcion
    def delete(self, request):
        if('id' in request.data):
            suscrito = SUSCRITO.objects.get(id=request.data['id'])
            suscrito.delete()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo eliminar la suscripcion"})
    
    #metodo para actualizar una suscripcion
    def put(self, request):
        if('id' in request.data and 'email' in request.data):
            suscrito = SUSCRITO.objects.get(id=request.data['id'])
            suscrito.email = request.data['email']
            suscrito.save()
            return Response({'status': 'ok'})
        else:
            return Response({"error": "No se pudo actualizar la suscripcion"})
    



class VerificarPermiso(object):
    
    def __init__(self, view_func):
        self.view_func = view_func
        wraps(view_func)(self)
        
    def __call__(self, request, *args, **kwargs):
        #Obtener url de la vista
        url = request.path_info
        print(url)
        #remover / de la url
        if(url == "/"):
            url = 'detalles'
        url = url.replace('/','')        

        PE ={
            "carrito": "ViewShoopingCart",
            "addproducto":"AddShoppingCart",
            "eliminaritem":"RemoveShoppingCart",
            "detalles":"ViewProduct",
            "index":"ViewProduct",
            "/":"ViewProduct",
            "venta":"PayShoppingCart",
            "ofertas":"ViewOffers",
            "historial":"ViewHistory",
            "vercompra":"ViewHistory",
            #admin
            "adminUsers":"AdminUsers",
            "statusUser":"AdminUsers",
            "registroAdmin":"AdminUsers",
            "adminProductos":"AdminProducts",
            "addProducto":"AdminProducts",
            "updateProducto":"AdminProducts",
            "productoCompraAdmin":"AdminBuys",
            "adminCompras":"AdminBuys",
            "cambiarEstado":"AdminBuys",
            "addUser":"AdminUsers",
            "addCategory":"AdminProducts",
        }
        #Obtener el permiso de la url
        if(url in PE):
            permiso = PE[url]
        else:
            return self.view_func(request, *args, **kwargs)

        permisos = request.user.get_all_permissions()
        
        #Verificar si el usuario tiene el permiso
        if "app."+permiso in permisos:
            response = self.view_func(request, *args, **kwargs)
            print("tiene permiso")
            return response
        else:
            print("no tiene permiso")
            messages.error(request, "No tienes permiso para acceder a esta página")
            return HttpResponseRedirect('/')


       
 


def permisosAdmin(request):
    from django.contrib.auth.models import User, Group, Permission
    from django.contrib.contenttypes.models import ContentType

    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='ViewShoopingCart',
                                        name='ViewShoopingCart',
                                        content_type=content_type) # creating permissions
    
    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='AddShoppingCart',
                                        name='AddShoppingCart',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='RemoveShoppingCart',
                                        name='RemoveShoppingCart',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='ViewProduct',
                                        name='ViewProduct',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='COMPRA')
    permission = Permission.objects.create(codename='PayShoppingCart',
                                        name='PayShoppingCart',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='ViewOffers',
                                        name='ViewOffers',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='COMPRA')
    permission = Permission.objects.create(codename='ViewHistory',
                                        name='ViewHistory',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='SUSCRITO')
    permission = Permission.objects.create(codename='AdminUsers',
                                        name='AdminUsers',
                                        content_type=content_type) # creating permissions
    
    content_type = ContentType.objects.get(app_label='app', model='PRODUCTO')
    permission = Permission.objects.create(codename='AdminProducts',
                                        name='AdminProducts',
                                        content_type=content_type) # creating permissions

    content_type = ContentType.objects.get(app_label='app', model='COMPRA')
    permission = Permission.objects.create(codename='AdminBuys',
                                        name='AdminBuys',
                                        content_type=content_type) # creating permissions
    
    #mensaje de exito
    messages.success(request, 'Permisos creados correctamente')
    return redirect('/')
    


def RecuperarContrasena(request):
    email = EmailMessage('Subject', 'Body', to=['arcediego39@gmail.com','diegoandresarceparra@gmail.com'])
    dat = email.send()
    
    if(dat):
        messages.success(request, 'Correo enviado correctamente')
        return redirect('/')
    print(dat)
    return redirect('/')


@login_required
@VerificarPermiso
def addCategory(request):
    if(request.method == 'POST'):
        category = CATEGORIA(nombre=request.POST['category'])
        category.save()
        messages.success(request, 'Categoría creada correctamente')
   
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    else:
        #Obtener todas las categorias
        categorias = CATEGORIA.objects.all()
        return render(request, 'addCategory.html', {'categorias':categorias})
    


@login_required
@VerificarPermiso
def suscripciones(request):
    if request.method == 'POST':
        #verificar si el usuario esta suscrito
        if(request.session.get('suscrito')):
            messages.error(request, 'Ya estas suscrito')
            return redirect('/')
            #crear suscripcion
        WebService(request, 'api/suscrito',{"idUsuario":request.user.id},"POST")
        messages.success(request, 'Suscripcion creada correctamente')
        request.session['suscrito'] = True
        return redirect('/')
    else:
        try:
            suscrito = SUSCRITO.objects.get(usuario=request.user)
            messages.error(request, 'Ya estas suscrito')
            return redirect('/')
        except SUSCRITO.DoesNotExist:
            pass
    return render(request, 'suscripcion.html')

@login_required
@VerificarPermiso
def nuevoProducto(request):
    if(request.method == 'POST'):
        nombre = request.POST.get('nombre')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        categoria = request.POST.get('categoria')
        categoria = CATEGORIA.objects.get(id=categoria)
        stock = request.POST.get('cantidad')
        oferta = request.POST.get('oferta')
        if(oferta == ""):
            oferta = 0
        estado =request.POST.get('estado')
        if(estado == '1'):
            estado = True
        else:
            estado = False
        try:
            producto = PRODUCTO()
            producto.nombre = nombre
            producto.descripcion = descripcion
            producto.imagen = request.FILES.get('imagen')
            producto.categoria = categoria
            producto.precio = precio
            producto.oferta = oferta
            producto.stock = stock
            producto.activo = estado
            producto.save()
            messages.success(request, 'Producto creado correctamente')
            return redirect('/adminProductos')
        except Exception as ex:
            print("================error=================")
            print(ex)
            messages.error(request, 'Error al crear producto')
            return redirect('/adminProductos')
    categorias = CATEGORIA.objects.all()
    return render(request, 'nuevoProducto.html', {'categorias': categorias})

@login_required
@VerificarPermiso
def updateProducto(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        descripcion = request.POST.get('descripcion')
        precio = request.POST.get('precio')
        categoria = request.POST.get('categoria')
        categoria = CATEGORIA.objects.get(id=categoria)
        stock = request.POST.get('cantidad')
        oferta = request.POST.get('oferta')
        if(oferta == ""):
            oferta = 0
        estado =request.POST.get('estado')
        if(estado == '1'):
            estado = True
        else:
            estado = False
        id = request.POST.get('id')
        producto = PRODUCTO.objects.get(id=id)
        producto.nombre = nombre
        producto.descripcion = descripcion
        #verificar si la imagen no esta vacio
        if(request.FILES.get('imagen') != None):
            producto.imagen = request.FILES.get('imagen')
        producto.categoria = categoria
        producto.precio = precio
        producto.oferta = oferta
        producto.stock = stock
        producto.activo = estado
        producto.save()
        messages.success(request, 'Producto actualizado correctamente')
        producto = PRODUCTO.objects.get(id=id)
        categorias = CATEGORIA.objects.all()
        return redirect('/adminProductos')
    IdProducto = request.GET.get('idProducto')
    producto = PRODUCTO.objects.get(id=IdProducto)
    categorias = CATEGORIA.objects.all()
    return render(request, 'nuevoProducto.html', {'categorias': categorias, 'producto': producto})


@login_required
@VerificarPermiso
def addUser(request):
    if(request.method == 'POST'):
        username = request.POST.get('user')
        password = request.POST.get('password')
        email = request.POST.get('email')
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        telefono = request.POST.get('telefono')
        direccion = request.POST.get('direccion')
        try:
            user = User.objects.create_user(username, email, password)
            user.first_name = nombre
            user.last_name = apellido
            user.save()
            suscrito = SUSCRITO(
                usuario=user, telefono=telefono, direccion=direccion)
            suscrito.save()
            messages.success(request, 'Usuario creado correctamente')
            return redirect('/adminUsers')
        except:
            messages.error(request, 'Error al crear usuario')
            return redirect('/adminUsers')
    return render(request, 'registerAdmin.html')
    # No backend authenticated the credentials


@login_required
@VerificarPermiso
def adminUsers(request):
    if(request.user.is_superuser):
        users = User.objects.all()
        return render(request, 'adminUsers.html', {'users': users})
    else:
        return redirect('/')

@login_required
@VerificarPermiso
def statusUser(request):
    idUsuario = request.GET.get('idUsuario')
    usuario = User.objects.get(id=idUsuario)
    if usuario == request.user:
        messages.error(request, 'No puedes cambiar tu propio estado')
        return redirect('/adminUsers')
    if(usuario.is_active):
        usuario.is_active = False
    else:
        usuario.is_active = True
    usuario.save()
    messages.success(request, 'Estado cambiado correctamente')
    # back to last page
    return redirect('/adminUsers')

@login_required
@VerificarPermiso
def adminProdutos(request):
    productos = PRODUCTO.objects.all()
    return render(request, 'adminProductos.html', {'productos': productos})


@login_required
@VerificarPermiso
def productoCompra(request):
    idCompra = request.GET.get('idCompra') # id de la compra
    compra = COMPRA.objects.get(id=idCompra)
    #verificar si la compra es del usuario actual
    if(compra.usuario != request.user): #si no es el usuario actual
        messages.error(request, 'No puedes ver la compra de otro usuario')
        return redirect('/adminCompras')
    productoCompra = COMPRA_PRODUCTO.objects.filter(compra=compra) #obtener los productos de la compra
    return render(request, 'productosHistorial.html', {'productos': productoCompra})


@login_required
@VerificarPermiso
def cambiarEstado(request):
    idCompra = request.POST.get('idCompra')
    idEstado = request.POST.get('idEstado')
    compra = COMPRA.objects.get(id=idCompra)
    estado = ESTADO_COMPRA.objects.get(id=idEstado)
    compra.estado = estado
    compra.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

    #volver a pagina anterior
@login_required
@VerificarPermiso
def productoCompraAdmin(request):
    idCompra = request.GET.get('idCompra')
    compra = COMPRA.objects.get(id=idCompra)
    productoCompra = COMPRA_PRODUCTO.objects.filter(compra=compra)
    estados = ESTADO_COMPRA.objects.all()
    return render(request, 'contenidoCompraAdmin.html', {'productos': productoCompra,'compra' : compra,"estados":estados})



@login_required
@VerificarPermiso
def compras(request):
    compras = COMPRA.objects.filter(usuario=request.user) # obtener todas las compras del usuario actual
    # ordenar por fecha descendente
    compras = compras.order_by('-fecha') # ordenar por fecha descendente
    return render(request, 'historial.html', {'compras': compras})


@login_required
@VerificarPermiso
def detalles(request):
    try:
        producto = request.GET.get('producto') #obtiene el id del producto desde la url 
        #cerificar que id sea numerico
        if(producto.isdigit()==False): #verifica que el id sea numerico y no un string o algo asi
            messages.error(request, 'El producto seleccionado no existe') #manda mensaje de error
            return redirect('/') #redirecciona a la pagina principal
        producto = PRODUCTO.objects.get(id=producto) #busa el producto en la base de datos usando el id  (select * from producto where id = producto)
        
        if(producto.stock<1): #verifica que el producto tenga stock
            messages.error(request, 'No hay stock disponible para el producto seleccionado')
            return redirect('/') #redirecciona a la pagina principal
        if(producto.activo == False): #verifica que el producto este activo en la base de datos
            messages.error(request, 'El producto seleccionado no esta disponible') #manda mensaje de error
            return redirect('/') #redirecciona a la pagina principal
        return render(request, 'detalles.html', {'producto': producto})
    except PRODUCTO.DoesNotExist:
        messages.error(request, 'El producto seleccionado no existe')
        return redirect('/')

@login_required
def index(request): #pagina de inicio donde se muestran los productos y se puede filtrar por categoria
    categoria = request.GET.get('categoria') #obtiene la ategoria
    if(categoria and categoria != ""): #si existe categoria y no esta vacia 
        productos = PRODUCTO.objects.filter(
            categoria__id=categoria, activo=True,stock__gt=0) #filtra por categoria 
            #todos los productos que sean de la categoria seleccionada y que tengan stock mayor a 0
        categoria = CATEGORIA.objects.get(id=categoria) #obtiene la categoria seleccionada y se la entrega a la vista para mostrar el nombre
    else:
        productos = PRODUCTO.objects.filter(activo=True,stock__gt=0) #si no existe categoria, filtra todos los productos que tengan stock mayor a 0 y esten activos
        categoria = None
    categorias = CATEGORIA.objects.all() #obtiene todas las categorias
    url = "http://" + request.get_host() + "/" #obtiene la url del host
    return render(request, 'productos.html', {'categorias': categorias, 'productos': productos, 'url': url, 'selected': categoria})


@login_required
@VerificarPermiso
def ofertas(request, id=None):
    #verificar si el usuario esta suscrito
    if(request.session['suscrito'] == False): #si no esta suscrito
        messages.error(request, 'Debes suscribirte para ver ofertas') #manda mensaje de error
        return redirect('/') #redirecciona a la pagina principal
    productos = PRODUCTO.objects.filter(activo=True, oferta__gt=0,stock__gt=0) #obtiene todos los productos que tengan oferta mayor a 0 y esten activos
    categoria = CATEGORIA() #crea una categoria vacia
    categoria.nombre = "Nuestras ofertas" #le asigna el nombre de ofertas a la categoria
    categorias = CATEGORIA.objects.all() #obtiene todas las categorias
    url = "http://" + request.get_host() + "/" #obtiene la url del host opara obtener la url de las imagenes del  producto
    return render(request, 'productos.html', {'categorias': categorias, 'productos': productos, 'url': url, 'selected': categoria})


@login_required
@VerificarPermiso
def addCarrito(request): #agrega un producto al carrito de compras 
    producto = request.POST.get('producto') #obtiene el id del producto desde el formulario
    cantidad = request.POST.get('cantidad') #obtiene la cantidad del producto desde el formulario
    if(int(cantidad) <1): #verifica que la cantidad sea mayor a 0
        messages.error(request, 'La cantidad debe ser mayor a 0') #manda mensaje de error
        return redirect(request.META.get('HTTP_REFERER')) #redirecciona a la pagina anterior

    if('carrito' not in request.session): #verifica que el carrito no exista
        request.session['carrito'] = [] #crea el carrito
    carrito = request.session["carrito"] #obtiene el carrito

    ObjProducto = PRODUCTO.objects.get(id=producto) #obtiene el producto de la base de datos
    if(ObjProducto.stock < int(cantidad)): #verifica que el stock sea mayor a la cantidad
        messages.error(request, 'No hay stock disponible para el producto seleccionado') #manda mensaje de error
        return redirect(request.META.get('HTTP_REFERER')) #redirecciona a la pagina anterior

    ObjProducto.stock = ObjProducto.stock - int(cantidad) #resta el stock del producto
    ObjProducto.save() #guarda el producto
    if request.session['suscrito'] == True and ObjProducto.oferta > 0: #verifica que el usuario este suscrito y que el producto tenga oferta
        precio = ObjProducto.oferta #en el caso de que exista oferta y esta susrito se le asigna el precio de oferta
    else:
        precio = ObjProducto.precio #en el caso de que no exista oferta o no este susrito se le asigna el precio normal

    # verificar si el producto ya esta en el carrito
    encontrado = False 
    for item in carrito: #recorre el carrito para ver si el producto ya esta en el carrito
        if(item["id"] == producto): #si el producto ya esta en el carrito
            item["cantidad"] = int(item["cantidad"]) + int(cantidad) #aumenta la cantidad del producto en el carrito
            item["total"] = int(item["cantidad"]) * int(precio) #calcula el total del producto
            encontrado = True #se indica que el producto ya esta en el carrito
            break

    if(not encontrado):  #si el producto no esta en el carrito
        total = precio * int(cantidad) #calcula el total del producto
        item = {'producto': ObjProducto.nombre, 'cantidad': cantidad, 'total': total,
                "id": producto, "precio": precio, "imagen": ObjProducto.imagen.url} #se crea el producto para añadirlo al arro
        carrito.append(item) #se agrega el producto al carrito
    request.session["carrito"] = carrito #se guarda el carrito en la sesion
    # volver a la pagina de la que viene
    messages.success(request, 'Producto agregado al carrito') #manda mensaje de exito
    return redirect(request.META.get('HTTP_REFERER')) #redirecciona a la pagina anterior    


@login_required
@VerificarPermiso
def venta(request): #venta de los productos del carrito
    if(request.method == 'POST'): #verifica si se estan enviando parametros por post
        carrito = request.session["carrito"] #obtiene el carrito de la sesion
        total = 0 #inicializa el total a 0
        for item in carrito:
            total += item["total"] #calcula el total de la compra
        

        tarjeta = request.POST.get('tarjeta') #trae numero de tarjeta desde formulario
        direccion = request.POST.get('direccion') #trae direccion desde formulario

        venta = COMPRA() #genera la venta
        venta.monto = total #asigna el total de la compra
        venta.tarjeta = tarjeta #asigna el numero de tarjeta
        venta.direccion = direccion #asigna la direccion
        venta.fecha = datetime.now() #asigna la fecha de la compra
        estado = ESTADO_COMPRA.objects.get(id=1) #obtiene el estado de la compra (compra realizada)
        venta.estado = estado #asigna el estado de la compra
        # obtener usuario conectado
        user = request.user #obtiene el usuario conectado
        venta.usuario = user #asigna el usuario conectado como comprador
        venta.save() #guarda la venta
        # obtener id de la venta
        # crear compra_producto
        for item in carrito:
            compra_producto = COMPRA_PRODUCTO() #genera la compra_producto
            compra_producto.compra = venta #le asigno la venta a la compra_producto 
            producto = PRODUCTO.objects.get(id=item["id"]) #obtiene el producto de la base de datos
            compra_producto.producto = producto #asigna el producto a la compra_producto
            compra_producto.cantidad = item["cantidad"] #asigna la cantidad a la compra_producto
            compra_producto.monto = item["precio"] #asigna el precio a la compra_producto
            compra_producto.save() #guarda la compra_producto 
            #producto.stock = producto.stock - int(item["cantidad"])
            producto.save()
        # limpiar carrito
        request.session["carrito"] = [] #limpia el carrito
        messages.success(request, 'Compra realizada correctamente') #manda mensaje de exito
        return redirect('/') 
    return render(request, 'venta.html')


@login_required
@VerificarPermiso
def logout(request):
    request.session.flush()
    return redirect("login")

@login_required
@VerificarPermiso
def eliminarCarrito(request):
    producto = request.GET.get('producto')
    carrito = request.session["carrito"]
    for item in carrito:
        if(item["id"] == producto):
            carrito.remove(item)
            Producto = PRODUCTO.objects.get(id=producto)
            Producto.stock = Producto.stock + int(item["cantidad"])
            Producto.save()
            break
    request.session["carrito"] = carrito
    return redirect(request.META.get('HTTP_REFERER'))

@login_required
@VerificarPermiso
def carrito(request):
    carrito = request.session["carrito"]
    #ver largo del carrito
    largo = len(carrito)
    if(largo == 0):
        messages.warning(request, 'No hay productos en el carrito') #manda mensaje de error
        return redirect('/') #redirecciona a la pagina anterior
    total = 0 #total de la compra en el carrito
    for item in carrito: 
        total += item["total"] #suma el total de cada producto del carrito
        
    url = "http://" + request.get_host()
    return render(request, 'carrito.html', {'carrito': carrito, 'total': total, 'url': url})





def logins(request):
    if(request.method == 'POST'): #verifica si se estan enviando parametros por post

        username = request.POST.get('user') #trae el usuario desde formulario
        password = request.POST.get('password') #trae la contraseña desde formulario
        user = authenticate(request, username=username, password=password) #verifica si el usuario y contraseña son correctoss
        # guardar usuario en sesion
        if(user is not None): #si el usuario y contraseña son correctos
            login(request, user) #guarda el usuario en la sesion
            resp = WebService(request,"api/suscrito",'idUsuario='+str(user.id)) #|verifica si el usuario esta suscrito llamando a un api
            request.session['suscrito'] = resp["suscrito"] #guarda el estado de la suscripcion en la sesion
            print(request.session['suscrito']) #imprime el estado de la suscripcion
            request.session['carrito'] = [] #inicializa el carrito en la sesion
            return redirect("/")
        else:
            print(User)
            return render(request, 'login.html', {'error': 'Usuario o contraseña incorrectos'})

    return render(request, 'login.html')
    # No backend authenticated the credentials

@login_required
@VerificarPermiso
def registroAdmin(request):
    if(request.method == 'POST'):
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        nombre = request.POST.get('name')
        apellido = request.POST.get('lastname')
        # verificar que el usuario existe
        try:
            user = User.objects.get(username=username)
            messages.error(request, 'El nombre usuario ya esta ocupado')
            return render(request, 'registerAdmin.html', {'error': 'El usuario ya existe'})
        except User.DoesNotExist:
            # verificar que el correo existe
            try:
                user = User.objects.get(email=email)
                messages.error(request, 'El correo ya esta ocupado')
                return render(request, 'registerAdmin.html', {'error': 'El correo ya existe'})
            except User.DoesNotExist:
                pass
        usuario = User.objects.create_user(username, email, password)
        usuario.first_name = nombre
        usuario.last_name = apellido
        usuario.email = email
        usuario.username = username
        # cifrar contraseña para django
        usuario.set_password(password)
        usuario.save()
        # añadir usuario a grupo
        if 'grupo' not in request.session:
            grupo = Group.objects.get(name='Cliente')
            usuario.groups.add(grupo)
        # mensaje de exito
        messages.success(request, 'Usuario registrado correctamente')
        return redirect("login")
    tipos =Group.objects.all()
    return render(request, 'registerAdmin.html', {'tipos': tipos})

@login_required
@VerificarPermiso
def adminCompras(request):
    compras = COMPRA.objects.all()
    return render(request, 'adminCompras.html', {'compras': compras})


def registroCliente(request):
    if(request.method == 'POST'):
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        nombre = request.POST.get('name')
        apellido = request.POST.get('lastname')
        # verificar que el usuario existe
        try:
            user = User.objects.get(username=username)
            messages.error(request, 'El nombre usuario ya esta ocupado')
            return render(request, 'registerAdmin.html', {'error': 'El usuario ya existe'})
        except User.DoesNotExist:
            # verificar que el correo existe
            try:
                user = User.objects.get(email=email)
                messages.error(request, 'El correo ya esta ocupado')
                return render(request, 'registerAdmin.html', {'error': 'El correo ya existe'})
            except User.DoesNotExist:
                pass
        usuario = User.objects.create_user(username, email, password)
        usuario.first_name = nombre
        usuario.last_name = apellido
        usuario.email = email
        usuario.username = username
        # cifrar contraseña para django
        usuario.set_password(password)
        usuario.save()
        # añadir usuario a grupo
        #verificar que grupo este en los parametros
        grup = request.POST.get('tipo')

        if grup == None or grup == '':
            grupo = Group.objects.get(name='Cliente')
            usuario.groups.add(grupo)
        else:
            print("grupo: " + grup)
            grupo = Group.objects.get(id=request.POST.get('tipo'))
            usuario.groups.add(grupo)
        messages.success(request, 'Usuario registrado correctamente')
        return redirect("login")
    return render(request, 'registerAdmin.html')
