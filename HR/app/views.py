from django.http import JsonResponse
from django.shortcuts import render

from app.models import Nav, User


def index(request):

    imgs = Nav.objects.all()
    print(imgs)
    print(imgs.first().img)
    return render(request,'index.html',context={'imgs':imgs})


def goodcart(request):
    return render(request,'goodcart.html')


def goodsInfo(request):
    return render(request,'goodsInfo.html')


def login(request):
    return render(request,'login.html')


def register(request):
    return render(request,'register.html')


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