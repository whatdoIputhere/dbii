from django.urls import path
from . import views

urlpatterns = [
    path('',views.index, name='index'),
    path('404',views.notFound, name='notFound'),
    path('login',views.login, name='login'),	
    path('register',views.register, name='register'),
]

handler404='bd2app.views.notFound'