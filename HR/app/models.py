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
    addr = models.CharField(max_length=200,default='大学城创客小镇')


    class Meta:
        db_table = 'hr_user'

class Goods(models.Model):
    type = models.CharField(max_length=40)
    src = models.CharField(max_length=200)
    name = models.CharField(max_length=256)
    intro = models.CharField(max_length=200)
    price = models.IntegerField()
    isdelete = models.CharField(max_length=20,default=0)
    smallimg1 = models.CharField(max_length=200)
    smallimg2 = models.CharField(max_length=200)
    smallimg3 = models.CharField(max_length=200)
    smallimg4 = models.CharField(max_length=200)
    smallimg5 = models.CharField(max_length=200)
    e_name = models.CharField(max_length=100,default='')
    bigimg = models.CharField(max_length=200)
    repertory = models.IntegerField(default=100)
    specification = models.CharField(max_length=40,default='尖品推荐')
    isselect = models.BooleanField(default=True)

    class Meta:
        db_table = 'hr_goods'

class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()

    iscollections = models.IntegerField(default=0)

    class Meta:
        db_table = 'hr_cart'

class Collections(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)


    class Meta:
        db_table= 'hr_collections'


class Order(models.Model):
    user = models.ForeignKey(User)
    createtime = models.DateTimeField(auto_now_add=True)
    updatetime= models.DateTimeField(auto_now=True)
    status = models.IntegerField(default=0)
    identifier = models.CharField(max_length=256)

    class Meta:
        db_table = 'hr_order'

class OrderGoods(models.Model):
    order = models.ForeignKey(Order)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()

    class Meta:
        db_table = 'hr_ordergoods'
