from django import http
from django.contrib import auth
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views import View

# Create your views here.
from shop.models import ShopMod


def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = auth.authenticate(username=username, password=password)
        if user:
            auth.login(request, user)
            return redirect('/index')
        else:
            return render(request, '/login.html', {'error': '用户名或密码错误'})
    return render(request, 'login.html')


class indexview(View):
    def get(self, request):
        shopmod = ShopMod.objects.all()
        return render(request, 'index.html', {'shopmod': shopmod})

    def post(self, request):
        mod = ShopMod()
        try:
            mod.name = request.POST.get('name')
            mod.price = request.POST.get('price')
            mod.stock = request.POST.get('stock')
            mod.sales = request.POST.get('sales')
            mod.save()
            return redirect('/index')
        except Exception as e:
            return http.HttpResponseForbidden('数据错误')


def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = User.objects.create_user(username=username, password=password, )
        user.save()
        return redirect('/login')
    return render(request, 'register.html')


def admin(request):
    return render(request, 'admin.html')


class Updateshopmod(View):
    def get(self, request, gid):
        try:
            mod = ShopMod.objects.get(id=gid)
            mod.delete()
        except Exception as e:
            return http.HttpResponseForbidden('删除失败')
        return redirect('/index')

    def post(self, request, gid=0):
        shopmod = ShopMod.objects.all()
        try:
            id = request.POST.get('id')
            for i in shopmod:
                if i.id == int(id):
                    i.name = request.POST.get('name')
                    i.price = request.POST.get('price')
                    i.stock = request.POST.get('stock')
                    i.sales = request.POST.get('sales')
                    i.save()
                    break
        except Exception as e:
            return http.HttpResponseForbidden('编辑失败')
        return redirect('/index')
