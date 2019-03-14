# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-14 13:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=40, unique=True)),
                ('password', models.CharField(max_length=256)),
                ('phonetnum', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'hr_user',
            },
        ),
    ]
