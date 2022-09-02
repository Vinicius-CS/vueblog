from django.db import models

class Role(models.Model):
    id          = models.AutoField(primary_key = True)
    name        = models.CharField(max_length = 255)
    description = models.CharField(max_length = 255)

class Permission(models.Model):
    id          = models.AutoField(primary_key = True)
    name        = models.CharField(max_length = 255)
    description = models.CharField(max_length = 255)
    role        = models.ForeignKey('Role', to_field = 'id', on_delete = models.CASCADE)

class Category(models.Model):
    id          = models.AutoField(primary_key = True)
    name        = models.CharField(max_length = 255, unique = True)
    description = models.CharField(max_length = 255)

class User(models.Model):
    id        = models.AutoField(primary_key = True)
    name      = models.CharField(max_length = 255)
    last_name = models.CharField(max_length = 255)
    email     = models.CharField(max_length = 255, unique = True)
    password  = models.CharField(max_length = 255)
    role      = models.ForeignKey('Role', to_field = 'id', on_delete = models.CASCADE)

class Article(models.Model):
    class StatusChoice(models.IntegerChoices):
        DRAFT     = 0
        PUBLISHED = 1
        TRASHED   = 2
    
    id          = models.AutoField(primary_key = True)
    title       = models.CharField(max_length = 255)
    thumbnail   = models.CharField(max_length = 255)
    description = models.CharField(max_length = 255)
    content     = models.CharField(max_length = 10000)
    category    = models.ForeignKey('Category', to_field = 'id', on_delete = models.CASCADE)
    tags        = models.CharField(max_length = 255)
    publish     = models.DateField()
    author      = models.ForeignKey('User', to_field = 'id', on_delete = models.CASCADE)
    status      = models.IntegerField(choices=StatusChoice.choices, default = StatusChoice.DRAFT)

class Comment(models.Model):
    id      = models.AutoField(primary_key = True)
    content = models.CharField(max_length = 500)
    publish = models.DateField()
    article = models.ForeignKey('Article', to_field = 'id', on_delete = models.CASCADE)
    author  = models.ForeignKey('User', to_field = 'id', on_delete = models.CASCADE)