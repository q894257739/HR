# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-17 09:37
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('iscollections', models.IntegerField(default=0)),
            ],
            options={
                'db_table': 'hr_cart',
            },
        ),
        migrations.CreateModel(
            name='Collections',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'hr_collections',
            },
        ),
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=40)),
                ('src', models.CharField(max_length=200)),
                ('name', models.CharField(max_length=256)),
                ('intro', models.CharField(max_length=200)),
                ('price', models.IntegerField()),
                ('isdelete', models.CharField(default=0, max_length=20)),
                ('smallimg1', models.CharField(max_length=200)),
                ('smallimg2', models.CharField(max_length=200)),
                ('smallimg3', models.CharField(max_length=200)),
                ('smallimg4', models.CharField(max_length=200)),
                ('smallimg5', models.CharField(max_length=200)),
                ('e_name', models.CharField(default='', max_length=100)),
                ('bigimg', models.CharField(max_length=200)),
                ('repertory', models.IntegerField(default=100)),
                ('specification', models.CharField(default='尖品推荐', max_length=40)),
                ('isselect', models.BooleanField(default=True)),
            ],
            options={
                'db_table': 'hr_goods',
            },
        ),
        migrations.CreateModel(
            name='Nav',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'hr_nav',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('addr', models.CharField(max_length=200)),
                ('identifier', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'hr_order',
            },
        ),
        migrations.CreateModel(
            name='OrderGoods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Goods')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Order')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=40, unique=True)),
                ('password', models.CharField(max_length=256)),
                ('phonetnum', models.CharField(max_length=20)),
                ('p_code', models.CharField(default='None', max_length=20)),
            ],
            options={
                'db_table': 'hr_user',
            },
        ),
        migrations.AddField(
            model_name='order',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.User'),
        ),
        migrations.AddField(
            model_name='collections',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Goods'),
        ),
        migrations.AddField(
            model_name='collections',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.User'),
        ),
        migrations.AddField(
            model_name='cart',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Goods'),
        ),
        migrations.AddField(
            model_name='cart',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.User'),
        ),
    ]
