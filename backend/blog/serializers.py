from rest_framework import serializers
from blog.models import Role, Permission, Category, User, Article, Comment

class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields=('id', 'name', 'last_name', 'email', 'role')

class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role 
        fields = ('id', 'name', 'description')

class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permission
        fields = ('id', 'name', 'description', 'role')

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name', 'description')

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'last_name', 'email', 'password', 'role')

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('id', 'title', 'thumbnail', 'description', 'content', 'category', 'tags', 'publish', 'author', 'status')

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('id', 'content', 'publish', 'article', 'author')