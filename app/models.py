from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class CATEGORIA(models.Model):
    nombre = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'categoria'


class SUSCRITO(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.usuario.username

    class Meta:
        db_table = 'suscrito'


class PRODUCTO(models.Model):
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)
    imagen = models.ImageField(upload_to='productos', blank=True)
    categoria = models.ForeignKey(CATEGORIA, on_delete=models.CASCADE)
    precio = models.IntegerField()
    oferta = models.IntegerField(default=0)
    stock = models.IntegerField()
    activo = models.BooleanField(default=True)
    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'producto'


class ESTADO_COMPRA(models.Model):
    nombre = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'estado_compra'


class COMPRA(models.Model):
    fecha = models.DateField()
    estado = models.ForeignKey(ESTADO_COMPRA, on_delete=models.CASCADE)
    monto = models.IntegerField()
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateField()
    direccion = models.CharField(max_length=200, default="")
    tarjeta = models.CharField(max_length=200, default="")

    def __str__(self):
        return self.fecha

    class Meta:
        db_table = 'compra'


class COMPRA_PRODUCTO(models.Model):
    compra = models.ForeignKey(COMPRA, on_delete=models.CASCADE)
    producto = models.ForeignKey(PRODUCTO, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    monto = models.IntegerField()

    def __str__(self):
        return self.compra.fecha

    class Meta:
        db_table = 'compra_producto'
