from django.conf.urls import url

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^goodcart/$', views.goodcart, name='goodcart'),
    url(r'^goodsInfo/(\d+)/$', views.goodsInfo, name='goodsInfo'),
    url(r'^login/$', views.login, name='login'),
    url(r'^register/$', views.register, name='register'),

    url(r'^checkusername/$', views.checkusername, name='checkusername'),

    url(r'^verifycode/$', views.verifycode, name='verifycode'),

    url(r'^protocol/$', views.protocol, name='protocol'),

    url(r'^checkverifycode/$', views.checkverifycode, name='checkverifycode'),

    url(r'^logout/$', views.logout, name='logout'),

    url(r'^addcart/(\d+)/$',views.addcart,name='addcart'),

    url('^no_login/$',views.no_login,name='no_login'),

    url('^changeselect/$',views.changeselect,name='changeselect'),

    url(r'^changeall/$',views.changeall,name='changeall'),

]
