from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view

from blog.models import Role, Permission, Category, User, Article, Comment
from blog.serializers import LoginSerializer, RoleSerializer, PermissionSerializer, CategorySerializer, UserSerializer, ArticleSerializer, CommentSerializer

import hashlib

@api_view(['POST'])
def UserLoginApi(request):
    if request.method == 'POST':
        user = User.objects.all()
        user_data = JSONParser().parse(request)
        
        if 'email' in user_data and 'password' in user_data:
            user_data['password'] = hashlib.md5(user_data['password'].encode()).hexdigest()

            def getUser(value):
                if value.email == user_data['email'] and value.password == user_data['password']:
                    return value
            user = filter(getUser, user)

            user_serializer = LoginSerializer(user, many = True)

            if len(user_serializer.data) > 0 is not []:
                return JsonResponse(user_serializer.data, status = status.HTTP_200_OK, safe = False)
            return JsonResponse("Failed to Login", status = status.HTTP_204_NO_CONTENT, safe = False)
        return JsonResponse("Failed Request", status = status.HTTP_400_BAD_REQUEST, safe = False)
    return JsonResponse("Failed Method", status = status.HTTP_405_METHOD_NOT_ALLOWED, safe = False)

@api_view(['POST'])
def UserRegisterApi(request):
    if request.method == 'POST':
        user_data = JSONParser().parse(request)
        
        if 'name' in user_data and 'last_name' in user_data and 'email' in user_data and 'password' in user_data:
            user_data['password'] = hashlib.md5(user_data['password'].encode()).hexdigest()
            register_serealizer = UserSerializer(data = user_data)

            if register_serealizer.is_valid():
                register_serealizer.save()
                user = User.objects.all()

                def getUser(value):
                    if value.email == user_data['email'] and value.password == user_data['password']:
                        return value
                user = filter(getUser, user)
                user_serializer = LoginSerializer(user, many = True)

                return JsonResponse(user_serializer.data, status = status.HTTP_201_CREATED, safe = False) 
            return JsonResponse("Failed Register", status = status.HTTP_204_NO_CONTENT, safe = False)
        return JsonResponse("Failed Request", status = status.HTTP_400_BAD_REQUEST, safe = False)
    return JsonResponse("Failed Method", status = status.HTTP_405_METHOD_NOT_ALLOWED, safe = False)

@api_view(['GET', 'POST'])
def ArticleApiList(request):
    if request.method == 'GET':
        article = Article.objects.get(id=id) 
        article_serializer=ArticleSerializer(article, many = True)
        return JsonResponse(article_serializer.data, safe = False)

    elif request.method == 'POST':
        article_data = JSONParser().parse(request)
        article = Article.objects.all().order_by('-publish')

        def getArticle(value):
            if (str(value.status) == str(article_data['status'])):
                value.author_id = User.objects.get(id = value.author_id).name + " " + User.objects.get(id = value.author_id).last_name
                value.category_id = Category.objects.get(id = value.category_id).name
                return value
        article = filter(getArticle, article)

        article_serializer = ArticleSerializer(article, many = True)

        if len(article_serializer.data) > 0 is not []:
            return JsonResponse(article_serializer.data, safe = False)
        return JsonResponse("Failed to Search Article", status = status.HTTP_204_NO_CONTENT, safe = False)
    return JsonResponse("Failed Method", status = status.HTTP_405_METHOD_NOT_ALLOWED, safe = False)

@api_view(['GET'])
def ArticleApiDetail(request, id):
    if request.method == 'GET':
        if id is not None:

            article = Article.objects.all().order_by('-publish')

            def getArticle(value):
                if (str(value.id) == str(id)):
                    value.author_id = User.objects.get(id = value.author_id).name + " " + User.objects.get(id = value.author_id).last_name
                    value.category_id = Category.objects.get(id = value.category_id).name
                    return value
            article = filter(getArticle, article)

            article_serializer = ArticleSerializer(article, many = True)

            if len(article_serializer.data) > 0 is not []:
                return JsonResponse(article_serializer.data, safe = False)
            return JsonResponse("Failed to Search Article", status = status.HTTP_204_NO_CONTENT)
        return JsonResponse("Failed Request", status = status.HTTP_400_BAD_REQUEST)
    return JsonResponse("Failed Method", status = status.HTTP_405_METHOD_NOT_ALLOWED)