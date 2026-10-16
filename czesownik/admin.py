from django.contrib import admin

from .models import Category, Comment, Thread

# Register your models here.
admin.site.register(Category)
admin.site.register(Comment)
admin.site.register(Thread)
