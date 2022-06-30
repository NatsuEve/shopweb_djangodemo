from django.db import models


# Create your models here.
class ShopMod(models.Model):
    name = models.CharField(max_length=50, verbose_name="商品名字")
    stock = models.IntegerField(default=0, verbose_name="库存")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="价格")
    sales = models.IntegerField(default=0, verbose_name="销量")

    def __str__(self):
        return '%s:%s' % (self.id, self.name)


class WebUser(models.Model):
    username = models.CharField(max_length=50, verbose_name="用户名")
    password = models.CharField(max_length=50, verbose_name="密码")
    email = models.EmailField(verbose_name="邮箱")
    phone = models.CharField(max_length=50, verbose_name="电话")

    def __str__(self):
        return '%s:%s' % (self.id, self.username)
