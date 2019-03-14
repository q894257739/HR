from django.conf.urls import url

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^goodcart/$', views.goodcart, name='goodcart'),
    url(r'^goodsInfo/$',views.goodsInfo,name='goodsInfo'),
    url(r'^login/$',views.login,name='login'),
    url(r'^register/$',views.register,name='register'),

    url(r'^checkusername/$',views.checkusername,name='checkusername'),

]
