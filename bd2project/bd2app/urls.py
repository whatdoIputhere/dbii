from django.urls import path
from . import views

urlpatterns = [
    path('',views.index, name='index'),
    path('404',views.notFound, name='notFound'),
    path('login',views.login, name='login'),	
    path('register',views.register, name='register'),
    path('logout',views.logout, name='logout'),
    path('gerircomponentes',views.gerirComponentes, name='gerircomponentes'),
    path('gerirutilizadores',views.gerirUtilizadores, name='gerirutilizadores'),
    path('gerirequipamentos',views.gerirEquipamentos, name='gerirequipamentos'),
    # path('editarcomponente',views.editarComponente, name='editarcomponente'),
    # path('editarutilizador',views.editarUtilizadores, name='editarutilizador'),
    # path('editarequipamento',views.editarEquipamentos, name='editarequipamento'),
]

handler404='bd2app.views.notFound'