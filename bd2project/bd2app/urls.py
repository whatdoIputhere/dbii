from django.urls import path
from . import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('',views.index, name='index'),
    path('404',views.notFound, name='notFound'),
    path('login',views.login, name='login'),	
    path('register',views.register, name='register'),
    path('logout',views.logout, name='logout'),
    path('gerircomponentes',views.gerirComponentes, name='gerircomponentes'),
    path('gerirutilizadores',views.gerirUtilizadores, name='gerirutilizadores'),
    path('gerirequipamentos',views.gerirEquipamentos, name='gerirequipamentos'),
    path('gerirfornecedores',views.gerirFornecedores, name='gerirfornecedores'),
    path('gerirencomendas',views.gerirEncomendas, name='gerirencomendas'),
    path('modals/componentes/editdeletecomponente',views.editDeleteComponenteModal, name='editdeletecomponente'),
    path('modals/fornecedores/editdeletefornecedor',views.editDeleteFornecedorModal, name='editdeletefornecedor'),
    path('modals/fornecedores/vieweditcomponentes',views.viewEditComponentesModal, name='vieweditcomponentes'),
    path('modals/equipamentos/editdeleteequipamento',views.editDeleteEquipamentoModal, name='editdeleteequipamento'),
    path('modals/encomendas/editdeleteencomenda',views.editDeleteEncomendaComponenteModal, name='editdeleteencomenda'),
]

urlpatterns += staticfiles_urlpatterns()

handler404='bd2app.views.notFound'