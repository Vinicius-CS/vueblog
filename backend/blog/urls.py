from django.urls import re_path as url
from blog import views

urlpatterns = [
    url(r'^api/login$', views.UserLoginApi),
    url(r'^api/register$', views.UserRegisterApi),

    url(r'^api/article$', views.ArticleApiList),
    url(r'^api/article/([0-9]+)$', views.ArticleApiDetail)
]