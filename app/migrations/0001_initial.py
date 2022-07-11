# Generated by Django 4.0.4 on 2022-06-30 20:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CATEGORIA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.CharField(max_length=200)),
                ('imagen', models.ImageField(blank=True, upload_to='categorias')),
            ],
            options={
                'db_table': 'categoria',
            },
        ),
        migrations.CreateModel(
            name='COMPRA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('monto', models.IntegerField()),
                ('fecha', models.DateField()),
            ],
            options={
                'db_table': 'compra',
            },
        ),
        migrations.CreateModel(
            name='ESTADO_COMPRA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'estado_compra',
            },
        ),
        migrations.CreateModel(
            name='TARJETA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField()),
                ('titular', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'tarjeta',
            },
        ),
        migrations.CreateModel(
            name='PRODUCTO',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.CharField(max_length=200)),
                ('imagen', models.ImageField(blank=True, upload_to='productos')),
                ('precio', models.IntegerField()),
                ('stock', models.IntegerField()),
                ('activo', models.BooleanField(default=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.categoria')),
            ],
            options={
                'db_table': 'producto',
            },
        ),
        migrations.CreateModel(
            name='COMPRA_PRODUCTO',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.IntegerField()),
                ('monto', models.IntegerField()),
                ('compra', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.compra')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.producto')),
            ],
            options={
                'db_table': 'compra_producto',
            },
        ),
        migrations.AddField(
            model_name='compra',
            name='estado',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.estado_compra'),
        ),
        migrations.AddField(
            model_name='compra',
            name='tarjeta',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.tarjeta'),
        ),
        migrations.AddField(
            model_name='compra',
            name='usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]