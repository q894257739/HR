from django.db import models

class Nav(models.Model):
    img = models.CharField(max_length=200)

    class Meta:
        db_table = 'hr_nav'

class User(models.Model):
    username = models.CharField(unique=True,max_length=40)
    password = models.CharField(max_length=256)
    phonetnum = models.CharField(max_length=20)


    class Meta:
        db_table = 'hr_user'


