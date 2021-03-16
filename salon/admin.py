from django.contrib import admin
from django.contrib.auth.models import Group, User
from .models import AuthUser,Salon,ServiceCategories, ProductCategories, Gallary, Appointment, Package, Product, Cart, Feedback, MembershipType, Offers, Packageservices, Purchase, PurchaseDetails, PurchaseReturn, PurchaseReturnDetails, Rating, Sales, SalesDetail, SalesReturn, SalesReturnDetails ,ServiceGiven, ServiceGivenDetails, Services, Specialist,Dealer
from django.contrib.admin.models import LogEntry
# User details
admin.site.site_header = 'Salon Dashboard'
LogEntry.objects.all().delete()
# admin.site.unregister(User)
# admin.site.unregister(Group)

class Authuser_admin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'username','email','cust_member_start_date','cust_member_end_date','membership_type_membership_type','contact_no', 'is_superuser','password']
    empty_value_display = 'empty'
admin.site.register(AuthUser, Authuser_admin)


#Salon details
class salonAdmin(admin.ModelAdmin):
    list_display = ['salon_name','address','contact_no', 'salon_email']
    list_filter = ['salon_name']
admin.site.register(Salon,salonAdmin)

#Service Categories Details
class S_Categories(admin.ModelAdmin):
    list_display = ['service_categories_no', 'service_categories_name','link']
admin.site.register(ServiceCategories,S_Categories)



class ProductInstanceInline(admin.StackedInline):
    model = Product

#Product Categories Details
class P_Categories(admin.ModelAdmin):
    list_display = ['product_categories_id', 'product_categories_name','link']
    inlines = [ProductInstanceInline]
admin.site.register(ProductCategories, P_Categories)

# Image Gallery Details
class img_gallery(admin.ModelAdmin):
    list_display = ['image_id','photo']
    #list_display_links = ['image_id']
    readonly_fields = ['photo']
admin.site.register(Gallary,img_gallery)

#Appointment details
class app_admin(admin.ModelAdmin):
    list_display = ['appointment_id','auth_user','appointment_date','appointment_time','appointment_status','specialist_specialist','services_service','package_package','link']
    list_filter = ('appointment_status',)
    empty_value_display = 'Empty'
admin.site.register(Appointment,app_admin)

#Service Package Details
class package_service(admin.ModelAdmin):
    list_display = ['package_name','package_start_dt','package_end_dt','link']
admin.site.register(Package,package_service)

# #Product to add cart Details
# class cartAdmin(admin.ModelAdmin):
#     list_display = ['prod_qty','product_product','total_price','user']
# admin.site.register(Cart,cartAdmin)


#Product Details
class ProductAdmin(admin.ModelAdmin):
     list_display = ['product_name','photo', 'product_price', 'product_desc', 'qty','product_categories_product_categories']
     list_filter = ['product_categories_product_categories']
     search_fields = ['product_name']
admin.site.register(Product,ProductAdmin)

#Feedback details
class FeedAdmin(admin.ModelAdmin):
    list_display = ['feedback_id','feedback_desc','date', 'services_service','product_product', 'specialist_specialist','auth_user']
admin.site.register(Feedback,FeedAdmin)

#Membership table Details
class Membership(admin.ModelAdmin):
    list_display = ['membership_type_id','membership_name','membership_duration','membership_fees','payment_type']
admin.site.register(MembershipType,Membership)

#Offer details
# class OfferAdmin(admin.ModelAdmin):
#     list_display = ['offer_id','offers_start_date','offers_end_date','discount']
# admin.site.register(Offers,OfferAdmin)

#Packages Services of Many service details
class packserv(admin.ModelAdmin):
    list_display = ['package_package','services_service']
    list_filter = ['package_package']
admin.site.register(Packageservices,packserv)


class PurchaseInstanceInline(admin.StackedInline):
    model = PurchaseDetails


#product purchase details
class purchaseAdmin(admin.ModelAdmin):
    list_display = ['purchase_id','purchase_date','purchase_amount','dealer_dealer','link']
    inlines = [PurchaseInstanceInline]

admin.site.register(Purchase,purchaseAdmin)


#Product purchase return details
# class purchasereturnAdmin(admin.ModelAdmin):
#    # list_display = ['purchase_return_id','purchase_return_date','purchase_return_amount','purchase_purchase']
#     list_display = ['purchase_return_purchase_return','product_product','purchase_return_qty']
# admin.site.register(PurchaseReturnDetails,purchasereturnAdmin)


#Product purchase all details

class PurDetails(admin.ModelAdmin):
   list_display = ['product_product','prod_qty','purchase_purchase']
   list_filter = ['purchase_purchase']


   # def Purcahse_Date(self, obj):
   #     return obj.purchase_purchase.purchase_date
   #
   # def Purchase_Amount(self, obj):
   #     return obj.purchase_purchase.purchase_amount
   # def Product_Price(self,obj):
   #     return obj.product_product.product_price

admin.site.register(PurchaseDetails,PurDetails)


#Purchase return
# class purReturn(admin.ModelAdmin):
#     list_display = ['purchase_return_id','purchase_return_date','purchase_return_amount','purchase_purchase']
# admin.site.register(PurchaseReturn,purReturn)

#Rating details
# class RatingAdmin(admin.ModelAdmin):
#     list_display = ['rating','user_user_id','product_product','auth_user']
# admin.site.register(Rating,RatingAdmin)

class SalesAdmin(admin.ModelAdmin):
    list_display = ['sales_id','address','phone','state','city','pincode','email_id','sales_date','payment','auth_user','link']
admin.site.register(Sales,SalesAdmin)

# class SaleReturnAdmin(admin.ModelAdmin):
#     list_display = ['sales_return_id','sales_return_date','sales_return_total_amount']
# admin.site.register(SalesReturn,SaleReturnAdmin)

class ServiceAdmin(admin.ModelAdmin):
    list_display = ['service_name','pics','service_duration','service_rate','service_categories_service_categories_no','offers_offer']
    list_filter = ('service_categories_service_categories_no',)
    # search_fields = ('service_name',)
admin.site.register(Services,ServiceAdmin)

class SerGivnAdmin(admin.ModelAdmin):
    list_display = ['service_given_id','service_date','amount','appointment_appointment','auth_user','package_package']
admin.site.register(ServiceGiven,SerGivnAdmin)

class SpecialstAdmin(admin.ModelAdmin):
    list_display = ['specialist_id', 'specialist_name','pics', 'gender', 'contact', 'service_categories_service_categories_no1', 'salon_salon','Report']
    readonly_fields = ['pics']
    list_display_links = ["Report"]
admin.site.register(Specialist,SpecialstAdmin)

# class SaleRetDtl(admin.ModelAdmin):
#     list_display = ['product_product', 'sales_return_sales_return', 'sales_return_qty']
# admin.site.register(SalesReturnDetails,SaleRetDtl)

class Saledtl(admin.ModelAdmin):
    list_display = ['product_product', 'sales_sales', 'qty_order', 'sales_price','Report']
    list_filter = ['sales_sales']
admin.site.register(SalesDetail,Saledtl)

# class Ser_gvn_dtl(admin.ModelAdmin):
#     list_display = []
# admin.site.register(ServiceGivenDetails,Ser_gvn_dtl)


class DealerAdmin(admin.ModelAdmin):
    list_display = ['dealer_id', 'dealer_name', 'dealer_contact_no', 'dealer_address', 'salon_salon']
admin.site.register(Dealer,DealerAdmin)
