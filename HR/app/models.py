from django.db import models

class Nav(models.Model):
    img = models.CharField(max_length=200)

    class Meta:
        db_table = 'hr_nav'

class User(models.Model):
    username = models.CharField(unique=True,max_length=40)
    password = models.CharField(max_length=256)
    phonetnum = models.CharField(max_length=20)
    p_code = models.CharField(max_length=20,default='None')


    class Meta:
        db_table = 'hr_user'

class Goods(models.Model):
    type = models.CharField(max_length=40)
    src = models.CharField(max_length=200)
    name = models.CharField(max_length=256)
    intro = models.CharField(max_length=200)
    price = models.IntegerField()
    isdelete = models.CharField(max_length=20,default='')
    smallimg1 = models.CharField(max_length=200)
    smallimg2 = models.CharField(max_length=200)
    smallimg3 = models.CharField(max_length=200)
    smallimg4 = models.CharField(max_length=200)
    smallimg5 = models.CharField(max_length=200)
    e_name = models.CharField(max_length=100,default='')
    bigimg = models.CharField(max_length=200)
    repertory = models.IntegerField(default=100)

    class Meta:
        db_table = 'hr_goods'






