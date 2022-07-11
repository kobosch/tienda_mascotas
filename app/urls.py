"""pagina URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .views import * 
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('carrito',carrito,name='carrito'), #ver carrito de compras
    path('login',logins,name='login'),
    path('index',index,name='productos'), #pagina de inicio donde se muestran los productos y se puede filtrar por categoria
    path('detalles',detalles,name='detalles'),
    path('addproducto',addCarrito,name='addCarrito'), #agrega un producto al carrito
    path('eliminaritem',eliminarCarrito,name='eliminarCarrito'),
    path('venta',venta,name='venta'), #realiza la venta
    path('ofertas',ofertas,name='venta'),
    path('logout',logout,name='logout'),
    path('historial',compras,name='historial'), #muestra las compras realizadas por el usuario
    path('vercompra',productoCompra,name='productoCompra'), #muestra los productos de una compra
    path('adminUsers',adminUsers,name='adminUsers'),
    path('statusUser',statusUser,name='statusUser'),
    path('addUser',addUser,name='addUser'),
    path('registro',registroCliente,name='registroCliente'),
    path('registroAdmin',registroAdmin,name='registro'),
    path('adminCompras',adminCompras,name='adminCompras'),
    path('productoCompraAdmin',productoCompraAdmin,name='productoCompraAdmin'),
    path('cambiarEstado',cambiarEstado,name='cambiarEstado'),
    path('adminProductos',adminProdutos,name='adminProdutos'),
    path('addProducto',nuevoProducto,name='addProducto'),
    path('updateProducto',updateProducto,name='updateProducto'),
    path('suscripciones',suscripciones,name='suscripciones'),
    path('addPermission',permisosAdmin,name='addPermission'),
    path('addCategory',addCategory,name='addPermissionUser'),
    #apis
    path('api/categorias',CATEGORIAS_API.as_view(),name='apiProductos'),
    path('api/suscrito',SUSCRIPCIONES_API.as_view(),name='apiProductos'),
    path('restorePassword',RecuperarContrasena,name='restorePassword'),
  #  path('test',testpermission,name='test'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
