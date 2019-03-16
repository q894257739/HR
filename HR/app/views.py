import hashlib
import random

import os,io

import time
from django.core.cache import cache
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect

from app.models import Nav, User, Goods, Cart
from PIL import Image,ImageDraw,ImageFont

from HR.settings import BASE_DIR

def index(request):
    imgs = Nav.objects.all()

    goods_list = Goods.objects.all()

    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)

        response_data = {
            'imgs': imgs,
            'goods_list':goods_list,
            'user': user
        }
    else:
        response_data = {
            'imgs': imgs,
            'goods_list':goods_list,
            'user':None
        }

    return render(request,'index.html',context=response_data)


def goodcart(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    carts = user.cart_set.all()

    isall = True
    for cart in carts:
        if not cart.goods.isselect:
            isall = False

    response_data = {
        'user':user,
        'carts':carts,
        'isall':isall,
    }
    return render(request,'goodcart.html',context=response_data)


def goodsInfo(request,goods_id):
    token = request.session.get('token')
    userid = cache.get(token)
    user = None
    if userid:
        user = User.objects.get(pk=userid)

    goods = Goods.objects.get(pk=goods_id)

    response_data = {
        'goods':goods,
        'user':user
    }

    return render(request,'goodsInfo.html',context=response_data)


def login(request):
    if request.method == "GET":
        return render(request, 'login.html')

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        users = User.objects.filter(username=username)
        if users.exists():
            user = users.first()
            if user.password == generate_password(password):
                token = generate_token()
                cache.set(token,user.id,60*60*24*3)
                request.session['token'] = token

                return redirect('app:index')
            else:
                response_data = {
                    'msg':'密码不正确'
                }
                return render(request,'login.html',context=response_data)
        else:
            response_data = {
                'err':'用户名不存在'
            }



    return render(request,'login.html',context=response_data)


def generate_password(password):
    md5 = hashlib.md5()
    md5.update(password.encode('utf-8'))
    return md5.hexdigest()


def generate_token():
    temp = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(temp.encode('utf-8'))
    return md5.hexdigest()



def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        phonenum = request.POST.get('phonenum')
        p_code = request.POST.get('p_code')

        user = User()
        user.username = username
        user.password = generate_password(password)
        user.phonetnum = phonenum
        user.p_code = p_code
        user.save()

        token = generate_token()
        cache.set(token, user.id, 60 * 60 * 24 * 3)
        request.session['token'] = token
        return redirect('app:index')




def checkusername(request):
    username = request.GET.get('username')
    users = User.objects.filter(username=username)

    if not users.exists():
        response_dir = {
            'msg': '用户名可用',
            'status': 1
        }

    else:
        response_dir = {
            'msg': '用户名被占用',
            'status': 0
        }

    return JsonResponse(response_dir)


def verifycode(request):
    width = 100
    height = 50

    bg_color = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))

    image = Image.new('RGB',(width,height),bg_color)

    draw = ImageDraw.Draw(image)

    for i in range(0,50):
        xy = (random.randrange(0,width),random.randrange(0,height))
        fill = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
        draw.point(xy=xy,fill=fill)

    temp = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'

    str = ''

    for i in range(0,4):
        str += temp[random.randrange(0,len(temp))]


    font = ImageFont.truetype(os.path.join(BASE_DIR,'static/fonts/GEORGIA.TTF'),30)

    font_color1 = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
    font_color2 = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
    font_color3 = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
    font_color4 = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))

    draw.text((10,10),str[0],font_color1,font=font)
    draw.text((35,10),str[1],font_color2,font=font)
    draw.text((50,10),str[2],font_color3,font=font)
    draw.text((75,10),str[3],font_color4,font=font)

    del draw

    buff = io.BytesIO()
    image.save(buff,'png')

    request.session['verify'] = str

    return HttpResponse(buff.getvalue(),'image/png')


def protocol(request):
    return render(request,'protocol.html')


def checkverifycode(request):
    code1 = request.session.get('verify').upper()
    code2 = request.GET.get('verifycode').upper()

    if code1 == code2:
        response_dir = {
            'msg': '验证通过',
            'status': 1
        }
    else:
        response_dir = {
            'msg': '验证码有误，请重新输入',
            'status':-1
        }

    return JsonResponse(response_dir)


def logout(request):
    request.session.flush()
    return redirect('app:index')


def addcart(request,goods_id):
    num = request.COOKIES.get('num')
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        goods = Goods.objects.get(pk=goods_id)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number += int(num)
            cart.save()

        else:
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = num
            cart.save()

        return redirect('app:goodcart')

    else:
        return render(request,'no_login.html')


def no_login(request):
    return render(request,'no_login.html')


def changeselect(request):
    goods_id = request.GET.get('goods_id')
    goods = Goods.objects.get(pk=goods_id)
    goods.isselect = not goods.isselect
    goods.save()

    response_data = {
        'msg':'选中状态修改成功',
        'status':1,
        'isselect':goods.isselect
    }

    return JsonResponse(response_data)


def changeall(request):

    isall = request.GET.get('isall')
    print(isall)
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    carts = user.cart_set.all()

    if isall == 'true':
        isall = True
    elif isall == 'false':
        isall = False
    for cart in carts:
        cart.goods.isselect =  isall
        cart.goods.save()

    response_data = {
        'msg':'全选状态修改成功',
        'status':1,
    }
    return JsonResponse(response_data)