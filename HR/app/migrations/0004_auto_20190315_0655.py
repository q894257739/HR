# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-15 06:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_user_p_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='p_code',
            field=models.CharField(default='', max_length=20),
        ),
    ]
