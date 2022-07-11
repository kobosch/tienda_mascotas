from django.contrib import admin

# Register your models here.
from .models import CATEGORIA, PRODUCTO, ESTADO_COMPRA, COMPRA, COMPRA_PRODUCTO,SUSCRITO

admin.site.register(CATEGORIA)
admin.site.register(PRODUCTO)
admin.site.register(ESTADO_COMPRA)
admin.site.register(COMPRA)
admin.site.register(COMPRA_PRODUCTO)
admin.site.register(SUSCRITO)



# admin.site.register(COMPRA_PRODUCTO)
