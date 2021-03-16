from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from . import views
app_name = 'salon'


urlpatterns = (
    # path('admin/', admin.site.urls),
     path("", views.welcome, name="welcome"),
     path("login/", views.login, name="login"),
     path("logout/", views.logout, name="logout"),
     path("index/", views.indexs, name="index"),
     path("about/", views.abouts, name="abouts"),
     path("profile/", views.profile, name="profile"),
     path("product/<int:pk>/", views.product, name="product"),
     path("register/", views.register, name="register"),
     path("package/", views.packser, name="package"),
     # path("package/<int:no>",views.totalPack,name="package"),
     path("barbers/", views.specialist, name="specialist"),
     path("service/", views.service, name="service"),
     path("servicedisplay/<int:no>/", views.servicedisplay, name="servicedisplay"),
     path("servicecategory/", views.service_cat, name="servicecategory"),
     path("Productcategory/", views.prodcat, name="Productcategory"),
     path("contact/<int:pk>/", views.contact, name="contact"),
     path("Gallery/", views.Gallery, name="Gallery"),
     path("appointment/", views.appointment, name="appointment"),
     path("appointmenttake/<int:pk>/", views.appointmenttake, name="appointmenttake"),
     path("appointPackage/<int:pk>/", views.packappointment, name="appointPackage"),
     path("appointmentcancel/", views.appointmentCancel, name="appointment"),
     path("appointmentchange/<int:pk>/", views.appointmentchange, name="appointment"),
     path("cart/", views.addTocart, name="cart"),
     path("cartdetails/", views.addTocarts, name="cartdetails"),
     path("removecart/<int:no>/", views.removecart, name="removecart"),
     path("mail/", views.mail, name="mail"),
     path('change_password/', views.change_password, name='change_password'),
     # path("feedback/", views.feedback, name="feed_save"),
     path("tmp/<int:no>/", views.tmp, name="tmp"),
     path("checkout/", views.checkout, name="checkout"),
     # path("checkout/",views.orders, name="checkout"),
     path("membership/", views.membership, name="membership"),
     path("takemembership/<int:no>/", views.takemembership, name="takemembership"),
     path("orderdetails/", views.orderdetails, name="orderdetails"),
     path("invoice/<int:no>/", views.invoice, name="invoice"),
     # path("invoicepdf/", views.render_to_pdf, name="invoicepdf"),
     path("serviceinvoice/<int:no>/", views.serviceInvoice,name="Sinvoice"),
     path("report/appointment_status/<int:no>",views.AppointmentReport, name="report"),
     path("salesReport/<int:no>",views.SalesOrderReport, name="salesReport"),
     path("specialistReport/<int:no>",views.specialistReport, name="specialistReport"),


)
