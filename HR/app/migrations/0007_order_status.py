# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-17 12:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_auto_20190317_1253'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='status',
            field=models.IntegerField(default=0),
        ),
    ]
