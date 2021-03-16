from datetime import *
from dateutil.relativedelta import relativedelta
from django.conf import settings
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.shortcuts import render, redirect, render_to_response
from django.http import Http404, HttpResponse,FileResponse
from django.template.loader import get_template, render_to_string
from django.template import loader, Template,Context
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Image
from reportlab.lib.pagesizes import letter
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet,ParagraphStyle
from reportlab.lib.units import inch, mm

from .models import Salon, ServiceCategories, Appointment, Specialist, AuthUser, Gallary, Services, Product, Cart, SalesDetail, Offers, Feedback, ProductCategories, Package, Packageservices, Sales, ServiceGiven, MembershipType
from django.contrib import messages
from django.contrib.auth.models import User, auth
from django.core.mail import send_mail
import pdfkit as pdf

from suit_dashboard.views import DashboardView
from suit_dashboard.views import DashboardView

class HomeView(DashboardView):
    pass

def indexs(request):
    # if request.user.is_authenticated == True:
    feed = Feedback.objects.all()
    return render(request, "salon/index.html", {'feedback': feed})


def service(request):
    # ser_cat = ServiceCategories.objects.filter(service_categories_service_categories_no=ServiceCategories.objects.service_categories_no)
    ser_cat = Services.objects.all()
    # service =Services.objects.all()
    # offers = Offers.objects.all()
    # if request.method == "POST":
    #     service_name = request.POST['service_name']
    #     service_url = request.POST['service_url']
    #     service_dur = request.POST['service_duration']
    #     rate = request.POST['service_rate']
    # #     # services_service = ServiceCategories.objects.get(service_categories_no=int(request.POST['service_categories_name']))
    #     ser_cat = ServiceCategories.objects.filter(service_categories_service_categories_no=int(request.POST['service_categories_no']))
    #     # services_service = ServiceCategories.objects.all().filter(service_categories_service_categories_no=request.POST['service_categories_no'])
    #     offer = Offers.objects.get(offer_id=request.POST['offer_id'])
    #     ser = Services(service_name=service_name, service_url=service_url, service_duration=service_dur, service_rate=rate,service_categories_service_categories_no=services_service, offer_offer=offer)
    #     ser.save()
    return render(request, "salon/service.html", {'service': ser_cat})


def service_cat(request):
    ser_cat = ServiceCategories.objects.all()
    # service= Services.objects.all().filter(service_categories_service_categories_no= int(request.POST['service_categories_name']))
    # #template = loader.get_template('salon/index.html')
    return render(request, "salon/servicecategory.html", {"ser_cat": ser_cat})


def servicedisplay(request, no):
    # service = ServiceCategories.objects.get(service_categories_no=int(request.POST['service_categories_name']))
    # id=int(ServiceCategories.objects.get(service_categories_no=int(request.POST['service_categories_name'])))
    # service= service_cat.GET.get('service_categories_no')
    no = ServiceCategories.objects.get(service_categories_no=no)
    ser_cat = Services.objects.filter(service_categories_service_categories_no=no)
    print(ser_cat)
    return render(request, "salon/servicedisplay.html", {'ser_cat': ser_cat, 'pk': no})


def abouts(request):
    return render(request, "salon/about.html")


@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'Your password was successfully updated!')
            return redirect('/login/')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'salon/change_password.html', {'form': form})


def prodcat(requset):
    prod = ProductCategories.objects.all()
    return render(requset, "salon/Productcategory.html", {'prod': prod})


def product(request, pk):
    p = ProductCategories.objects.get(product_categories_id=pk)
    products = Product.objects.filter(product_categories_product_categories=p)
    feedbck = Feedback.objects.filter(product_product=products)
    return render(request, "salon/product.html", {'products': products,'feedback':feedbck})


def logout(request):
    auth.logout(request)
    return redirect('salon:login')


def login(request):
    # authuser= AuthUser.objects.all()
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        # user.profile.role='is_superuser'

        if user is not None:
            auth.login(request, user)
            usrObj = AuthUser.objects.get(username=user.username)
            if usrObj.is_staff:
                # print("Login succesfully")
                # messages.info(request, "Login Succesfully")
                return redirect('/admin/')
            else:
                return redirect('/index/')
        else:
            messages.info(request, "Invalid username or password")
            return redirect("/login/")
    else:
        return render(request, "salon/login.html")

@login_required()
def appointment(request):
    specialists = Specialist.objects.all()
    authUser = AuthUser.objects.all()
    services = Services.objects.all()
    if request.method == "POST":
        appointment_date = request.POST['appointment_date']
        appointment_time = request.POST['appointment_time']
        # appointment_status = request.POST['appointment_status']
        services_service = Services.objects.get(service_id=int(request.POST['service_name']))
        # print(services_service.service_id)
        specialist_specialist = Specialist.objects.get(specialist_id=int(request.POST['specialist_name']))
        auth_user = AuthUser.objects.get(id=int(request.POST['username']))
        apt = Appointment(appointment_date=appointment_date, appointment_time=appointment_time,
                          services_service=services_service, appointment_status=1,
                          specialist_specialist=specialist_specialist, auth_user=auth_user)
        apnt = Appointment.objects.filter(appointment_date=appointment_date,appointment_time=appointment_time,specialist_specialist=specialist_specialist)
        if len(apnt) > 0:
            return HttpResponse("This appointment time already taken")
        else:
            apt.save()
            services_service = Services.objects.get(service_id=int(request.POST['service_name']))
            user_email = AuthUser.objects.get(id=request.user.id)
            datee = appointment_date  # Appointment.objects.filter(appointment_id=(request.POST['appointment_date']))
            time = appointment_time
            print(time)
            print(services_service)
            subject = "OWNER OF KALLISTAA"
            msg = "Dear customer your appointment for " + str(
                services_service) + " is booked on " + datee + " at " + time
            to = user_email.email
            res = send_mail(subject, msg, settings.EMAIL_HOST_USER, [to])

            if (res == 1):
                msg = "Mail Sent Successfuly"
            else:
                msg = "Mail could not sent"
            print(msg)

        # if apnt.appointment_date == appointment_date:
        #     if apnt.appointment_time == appointment_time and apnt.specialist_specialist == specialist_specialist:
        #         return HttpResponse("This appointment time already taken")
        # else:
        #     apt.save()

        print("Appointment Booked")
        print("Service Given is called")
        # ser_book = ServiceGiven()
        # ser_book.service_date = appointment_date
        # ser_book.amount = services_service.service_rate
        # ser_book.appointment_appointment = apt
        # ser_book.auth_user = AuthUser.objects.get(id=request.user.id)
        # ser_book.package_package = Package.objects.get(package_id=1)  # int(request.POST['packid']
        # ser_book.save()
        print("Service given is confirmed")
    return render(request, 'salon/appointment.html',
                  {'ser_cat': services, 'specialist': specialists, 'authUser': authUser})


# def serviceBOOk(request,pk):
#     ser_book = ServiceGiven.objects.all()
#     id = Appointment.objects.filter(auth_user=request.user.id)
#     ser_book.service_date = id.appointment_date
#     ser_book.amount = id.services_service.service_rate
#     ser_book.appointment_appointment = ServiceGiven.objects.get(appointment_appointment=pk)
#     ser_book.package_package = 1
#     ser_book.save()
#     return HttpResponse("Service is Given to the customer")


@login_required()
def appointmenttake(request, pk):
  try:
    no = Services.objects.get(service_id=pk)
    ser_cat = Appointment.objects.filter(services_service=no)
    specialists = Specialist.objects.all()
    packages = Package.objects.all()
    authUser = AuthUser.objects.all()
    if request.method == "POST":
        appointment_date = request.POST['appointment_date']
        appointment_time = request.POST['appointment_time']
        # appointment_status = request.POST['appointment_status']
        services_service = no  # Services.objects.get(service_id=int(request.POST['service_name']))
        specialist_specialist = Specialist.objects.get(specialist_id=int(request.POST['specialist_name']))
        auth_user = AuthUser.objects.get(id=int(request.POST['username']))
        apt = Appointment(appointment_date=appointment_date, appointment_time=appointment_time,
                          services_service=services_service, appointment_status=1,
                          specialist_specialist=specialist_specialist, auth_user=auth_user)
        # apt.save()
        apnt = Appointment.objects.filter(appointment_date=appointment_date, appointment_time=appointment_time,
                                          specialist_specialist=specialist_specialist)
        if len(apnt) > 0:
            return HttpResponse("This appointment time already taken")
        else:
            apt.save()
       # Mail sent
        services_service = Services.objects.get(service_id=int(request.POST['service_name']))
        user_email = AuthUser.objects.get(id=request.user.id)
        datee = appointment_date  # Appointment.objects.filter(appointment_id=(request.POST['appointment_date']))
        time = appointment_time
        print(time)
        print(services_service)
        subject = "Greetings"
        msg = "Dear customer your appointment for " + str(services_service) + " is booked on " + datee + " at " + time
        to = user_email.email
        res = send_mail(subject, msg, settings.EMAIL_HOST_USER, [to])

        if (res == 1):
            msg = "Mail Sent Successfuly"
        else:
            msg = "Mail could not sent"
        print(msg)
        # service given
        # print("Service Given is called")
        # ser_book = ServiceGiven()
        # ser_book.service_date = appointment_date
        # ser_book.amount = services_service.service_rate
        # ser_book.appointment_appointment = apt
        # ser_book.auth_user = AuthUser.objects.get(id=request.user.id)
        # ser_book.package_package = Package.objects.get(package_id=1) #int(request.POST['packid']
        # ser_book.save()
        # print("Service given is confirmed")
    return render(request, "salon/appointmentservice.html",
                  {'ser_cat': no, 'specialist': specialists, 'authUser': authUser, 'packages': packages})
  except:
      messages.success(request,"You're not logged in user")


def packappointment(request,pk):
        no = Packageservices.objects.filter(package_package=pk)
        serv= []
        for i in no:
         ser = Services.objects.get(service_id=i.services_service.service_id)
         serv.append(ser)
        packs =Package.objects.get(package_id=pk)
        specialists = Specialist.objects.all()
        authUser = AuthUser.objects.all()
        if request.method == "POST":
            appointment_date = request.POST['appointment_date']
            appointment_time = request.POST['appointment_time']
            # appointment_status = request.POST['appointment_status']
            packages_package = packs
            specialist_specialist = Specialist.objects.get(specialist_id=int(request.POST['specialist_name']))
            auth_user = AuthUser.objects.get(id=int(request.POST['username']))
            apt = Appointment(appointment_date=appointment_date, appointment_time=appointment_time,
                              package_package=packages_package, appointment_status=1,
                              specialist_specialist=specialist_specialist, auth_user=auth_user)
            apnt = Appointment.objects.filter(appointment_date=appointment_date, appointment_time=appointment_time,
                                              specialist_specialist=specialist_specialist)
            if len(apnt) > 0:
                return HttpResponse("This appointment time already taken")
            else:
                apt.save()
            # Mail sent
            user_email = AuthUser.objects.get(id=request.user.id)
            datee = appointment_date  # Appointment.objects.filter(appointment_id=(request.POST['appointment_date']))
            time = appointment_time
            print(time)
            print(packs)
            subject = "Greetings"
            msg = "Dear customer your appointment for " + str(
                packs) + " is booked on " + datee + " at " + time
            to = user_email.email
            res = send_mail(subject, msg, settings.EMAIL_HOST_USER, [to])

            if (res == 1):
                msg = "Mail Sent Successfuly"
            else:
                msg = "Mail could not sent"
            print(msg)
            # print("Service given is confirmed")
        return render(request, "salon/appointPackage.html",
                      {'ser_cat': serv, 'specialist': specialists, 'authUser': authUser, 'packname':no})


@login_required
def appointmentCancel(request):
    if request.method == "POST":
        id=request.POST['id']
        print(id)
        pk=Appointment.objects.get(appointment_id=id)
        pk.appointment_status=0
        pk.save()
        return HttpResponse("Your appointment is cancelled.")
    return redirect('salon:profile')
    # pk = Appointment.objects.filter(auth_user=request.user.id)
    # print(pk)
    # print("appointment cancel")
    # # apnt= Appointment.objects.get.appointment_date
    # # apnt= Appointment.objects.get.appointment_time
    # apnt = Appointment.objects.get(appointment_status=0)
    # apnt = Specialist.objects.get(specialist_id=int(request.POST['specialist_name']))
    # apnt= Services.objects.get(service_id=int(request.POST['service_name']))
    # apnt = pk
    # apnt.save()
    # usr = AuthUser.objects.get(id=pk)
    # id= Appointment.objects.filter(auth_user=usr,appointment_status=0)
    # return render(request,"salon/appointmentcancel.html",{'appoint': pk})



def specialist(request):
    specialist_image = Specialist.objects.all()
    servicecats = ServiceCategories.objects.all()
    if request.method == "POST":
        servicecat = ServiceCategories.objects.get(service_categories_name=str(request.POST['service_categories_name']))
    #     name = request.POST["specialist_name"]
    #     gender = request.POST["gender"]
    #     contacts = request.POST["contact"]
    #     cat = request.POST["service_categories_service_categories_no1"]
    #     spl = Specialist(specialist_name=name, gender=gender, contact=contacts, service_categories_service_categories_no1=cat)
    #     spl.save()
    return render(request, 'salon/barbers.html', {'specialist_image': specialist_image})


def Gallery(request):
    image = Gallary.objects.all()
    return render(request, 'salon/Gallery.html', {'image': image})


def register(request):
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        # phone = request.POST['contact']
        email = request.POST['email']

        if password1 == password2:
            if User.objects.filter(username=username).exists():
                messages.info(request, 'User name taken')
                return redirect('/register')
                # print('Username is already exist')
            elif User.objects.filter(email=email).exists():
                messages.info(request,'Email already exist')
                return redirect('/register')
            else:
                user = User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name, is_staff=0)
                user.save()
                print('User created')
                return redirect("/login")
        else:
            messages.info(request, "Password is Incorrect")
            return redirect('/register')
        # return redirect('/')
    else:
        return render(request, 'salon/register.html')


def addTocart(request):
        if request.method == 'POST':
            newcart = Cart()
            id = Product.objects.get(product_id=int(request.POST['pid']))
            newcart.prod_qty = request.POST['qty']
            print(type(newcart.prod_qty))
            newcart.total_price = int(newcart.prod_qty) * id.product_price
            print(type(newcart.total_price))
            print(type(id.product_price))
            newcart.product_product = id
            newcart.user = AuthUser.objects.get(id=request.user.id)
            carts = Cart.objects.filter(user=request.user.id).exists()
            if carts is True:
                if Cart.product_product == newcart.product_product:
                    return HttpResponse("This product is already in cart")
                else:
                    newcart.save()
            newcart.save()

            id.qty -= int(newcart.prod_qty)
            id.save()
            return redirect("salon:product", pk=id.product_categories_product_categories.product_categories_id)
        else:
            return redirect("salon:cart")

@login_required()
def addTocarts(request):
    products = Cart.objects.filter(user=request.user.id)
    # carts = Cart.objects.all()
    count = 0
    for i in products:
        count += i.total_price
    print(count)
    return render(request, "salon/cart.html", {'product': products,'total': count})


def removecart(request, no):
    id = Product.objects.get(product_id=no)
    user = AuthUser.objects.get(id=request.user.id)
    newcart = Cart.objects.get(product_product=id, user=user)
    id.qty += int(newcart.prod_qty)
    id.save()
    newcart.delete()
    return redirect("salon:cartdetails")


def profile(request):
    details = AuthUser.objects.get(id=request.user.id)
    date = datetime.today()
    sale = details.sales_set.filter(sales_date__gte=date)
    orders = []
    for i in sale:
        for ordrs in i.salesdetail_set.filter():
            orders.append(ordrs)
    date = datetime.today()
    apnt = Appointment.objects.filter(auth_user=request.user.id,appointment_status=1, appointment_date__gte=date)
    return render(request, "salon/profile.html", {'details': details, 'show': apnt, 'order': orders})


@login_required()
def tmp(request, no):
    fdbckObj = Feedback()
    srvcObj = Services.objects.get(service_id=no)
    fdbckObj.feedback_desc = request.POST['feedback_desc']
    fdbckObj.date = datetime.now()
    fdbckObj.services_service = srvcObj
    fdbckObj.auth_user = AuthUser.objects.get(username=request.user.username)
    fdbckObj.save()
    print("Feedback is taken")
    return render(request, 'salon/contact.html')


def contact(request, pk):
    service = Services.objects.filter(service_id=pk)
    return render(request, "salon/contact.html", {'sercat': service})


def appointmentchange(request, pk):
    # apnt= Appointment.objects.all()
    # return render(request,'salon/index.html',{'appoint':apnt})
    # au = AuthUser.objects.get(id=pk)
    # pk = Appointment.objects.all().filter(auth_user=request.user.id)
    specialists = Specialist.objects.all()
    services = Services.objects.all()
    if request.method == "POST":
        appointment_date = request.POST['appointment_date']
        appointment_time = request.POST['appointment_time']
        # appointment_status = request.POST['appointment_status']
        services_service = Services.objects.get(service_id=int(request.POST['service_name']))
        print(services_service.service_id)
        specialist = Specialist.objects.get(specialist_id=int(request.POST['specialist_name']))
        usr = AuthUser.objects.get(id=request.user.id)
        apt = Appointment(appointment_date=appointment_date, appointment_time=appointment_time,
                          services_service=services_service, appointment_status=1, specialist_specialist=specialist,
                          auth_user=usr)
        apt.save()
        print("Appointment Changed")
        # messages.info(request,"Appointment Confirm")
        # return redirect('/index/')
    return render(request, 'salon/appointment.html',
                  {'ser_cat': services, 'specialist': specialists})


def mail(request):
    subject = "Owner of KALISTAA"
    msg = "Your appointment is booked."
    to = "bhavinvghl@gmail.com"
    res = send_mail(subject, msg, settings.EMAIL_HOST_USER, [to])

    if(res == 1):
        msg = "Mail Sent Successfuly"
    else:
        msg = "Mail could not sent"
    print(msg)
    #return HttpResponse(msg)
    return render(request,'salon/index.html')


# def package(request):
#     packages = Package.objects.all()
#     return render(request, "salon/package.html", {'packages': packages})


def packser(request):
    # pack_ser = Packageservices.objects.all()
    packages = Package.objects.all()
    packs = Packageservices.objects.all()
    rate = []
    total = []
    for pack in packages:
        pack.pack_servs=pack.packageservices_set.all()
        packs.id = pack.package_id
        pk = packs.id
        pack.no = Packageservices.objects.filter(package_package=pack)
        print(pack.no)
        rates = 0
        totals = 0
        for i in pack.no:
            rates += i.services_service.service_rate
            totals += i.services_service.service_rate - (i.services_service.service_rate * 15 / 100)
        rate.append(int(rates))
        total.append(int(totals))
        print('Rates', rates)
        # for j in pack.no:

        print('Discount',total)
    return render(request, "salon/package.html", {'package': packages, 'total': list(total), 'rate': rate})

# def totalPack(request,no):
#     ps = Packageservices.objects.filter(package_package=no)
#     rate = []
#     total = []
#     for pack in ps:
#         # pack.pss = pack.packageservices_set.all()
#         rate += pack.services_service.service_rate
#         total += pack.services_service.service_rate - (pack.services_service.service_rate * 15 / 100)
#     # rate.append(int(rates))
#     # total.append(int(totals))
#     print('Rates', rate)
#     print('Rates', total)


def checkout(request):
        prod = Cart.objects.filter(user=request.user.id)
        count = 0
        for i in prod:
            count += i.total_price
        print("Order is called")
        saleid = None
        return render(request, "salon/checkout.html", {'product': prod, 'price': count, 'saleid': saleid})


def orderdetails(request):
        ids = 0
        dates = datetime.today() + relativedelta(days=+8)
        print(dates)
        if request.method == 'POST':
            date = dates
            address = request.POST['address']
            phone = request.POST['phone_number']
            city = request.POST['city']
            state = request.POST['state']
            zip = request.POST['zip_code']
            email = request.POST['email_address']
            payment = request.POST['payment']
            usr = AuthUser.objects.get(id=request.user.id)
            sale = Sales(sales_date=date, payment=payment, auth_user=usr, address=address, phone=phone, city=city,
                         state=state, pincode=zip, email_id=email)
            sale.save(force_insert=True)
            ids = sale.sales_id
            print("Confirm sales")
            print("Details is called")
            carts = Cart.objects.all()
            for i in carts:
               details = SalesDetail()
               details.sales_sales = sale
               details.product_product = i.product_product
               details.qty_order = i.prod_qty
               details.sales_price = i.total_price
               details.save(force_insert=True)
            print("cart is empty")
            cart = Cart.objects.all()
            cart.delete()
            details = SalesDetail.objects.filter(sales_sales=sale)
            sums = 0
            for i in details:
                sums += i.sales_price
            dates = datetime.now().date()
        return render(request, "salon/thankyoupage.html",{'saleid':ids})


def invoice(request,no):
    # sales = Sales.objects.get(auth_user=request.user.id)
    details = SalesDetail.objects.filter(sales_sales=no)
    sums = 0
    for i in details:
        sums += i.sales_price
    dates = datetime.now().date()
    # html_string = render_to_string('bedjango/pdf.html', {'people': details})
    # html = HTML(string=html_string)
    # result = html.write_pdf()
    # response = HttpResponse(content_type='application/pdf;')
    # response['Content-Disposition'] = 'inline; filename=list_people.pdf'
    # response['Content-Transfer-Encoding'] = 'binary'
    # with tempfile.NamedTemporaryFile(delete=True) as output:
    #     output.write(result)
    #     output.flush()
    #     output = open(output.name, 'r')
    #     response.write(output.read())
    # return response
    return render_to_response(request, "salon/invoice.html", {'sell': details,'date': dates, 'total':sums})

def welcome(request):
    return render(request,"salon/welcome.html")


def membership(request):
    members = MembershipType.objects.all()
    return render(request,"salon/membership.html", {'members':members})


@login_required()
def takemembership(request,no):
    print("membership is called")
    users = AuthUser.objects.get(id=request.user.id)
    if users.membership_type_membership_type is None:
        members = MembershipType.objects.get(membership_type_id=no)
        month = int(members.membership_duration)
        print(month)
        months = datetime.today() + relativedelta(months=+month)
        print(months)
        todays = datetime.now()
        users.cust_member_start_date = todays
        users.cust_member_end_date = months
        users.membership_type_membership_type = members
        users.save()
        return HttpResponse('Your Membership was successfully taken!')
    else:
        return HttpResponse("You're already taken membership")


def serviceInvoice(request, no):
    apnts = Appointment.objects.filter(appointment_id=no)
    return render(request, "salon/serviceinvoice.html", {'ser_Inv': apnts})

def AppointmentReport(request,no):
    appntmnt = Appointment.objects.all()
    head= ['Customer Name','Service Name','Appointment Date','Specialist Name','Appointment Time','Status']
    image = Image('http://127.0.0.1:8000/static/images/logos/logo.png', height=30, width=120)
    lst = [[image],['Appointment Cancel Report'],head]
    for item in appntmnt:
        if(item.appointment_status == no):
            lst.append([item.auth_user,item.services_service,item.appointment_date,item.specialist_specialist,item.appointment_time,item.appointment_status])
        else:
            pass
    filename = 'AppointmentCancelreport.pdf'
    pdf = SimpleDocTemplate(
        filename,
        pagesize=letter,
        title='Title here..'
    )
    style = TableStyle([
        ('SPAN', (0, 0), (-1, 0)),
        ('SPAN', (0, 1), (0, 1)),
        # ('SPAN', (0, 2), (-1, 2)),
        # ('SPAN', (0, -1), (-1, -1)),
        ('FONTSIZE', (0, 1), (0, 1), 18),
        ('BACKGROUND', (0, 2), (-1, 2), colors.palevioletred),
        # ('TEXTCOLOR', (0, 3), (-1, 3), colors.whitesmoke),
        # ('ALIGN', (0, 1), (0, 1), 'CENTER'),
        ('ALIGN', (0, 0), (0, 0), 'RIGHT'),
        # ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        # ('FONTSIZE', (0, 2), (-1, 2), 20),
        ('BOTTOMPADDING', (0, 0), (0, 0), 10),
        # ('TOPPADDING', (0, 2), (-1, 2), 7),
        ('TOPPADDING', (0, 0), (0, 0), -100),
        # ('TOPPADDING', (0, -1), (-1, -1), 15),
        # ('SPAN', (0, -1), (-1, -1)),
        # ('FONTSIZE', (0, 3), (-1, -1), 10),
        ('BOTTOMPADDING', (0, 1), (0, 1), 40),
        ('GRID', (0, 2), (-1, -1), 0.25, colors.black),
    ])
    table = Table(lst, colWidths=(30*mm, None, None, 30*mm, None, 20*mm))
    table.setStyle(style)
    elems = []
    elems.append(table)
    pdf.build(elems)
    return FileResponse(open(filename, 'rb'), as_attachment=False, filename=filename)

def SalesOrderReport(request,no):
    sale = SalesDetail.objects.all()
    usr = AuthUser.objects.get(id=request.user.id)
    head= ['No.','Customer Name','Product Name','Qty','Price','Address','Contact No','SellingDate','Payment']
    image = Image('http://127.0.0.1:8000/static/images/logos/logo.png', height=40, width=150)
    lst = [[image],['Sales Report'],head]
    for item in sale:
        if(item.sales_sales.sales_id == no):
            lst.append([item.sales_sales.sales_id,item.sales_sales.auth_user.first_name,item.product_product,item.qty_order,item.sales_price,item.sales_sales.address,item.sales_sales.phone,item.sales_sales.sales_date,item.sales_sales.payment])
        else:
            pass
            # lst.append([item.auth_user, item.services_service, item.appointment_date, item.specialist_specialist,item.appointment_time, item.appointment_status, item.package_package])

    filename = 'SalesOrderReport.pdf'
    pdf = SimpleDocTemplate(
        filename,
        pagesize=letter,
        title='Title here..'
    )
    style = TableStyle([
        ('SPAN', (0, 0), (-1, 0)),
        ('SPAN', (0, 1), (0, 1)),
        # ('SPAN', (0, 2), (-1, 2)),
        # ('SPAN', (0, -1), (-1, -1)),
        ('FONTSIZE', (0, 1), (0, 1), 18),
        ('BACKGROUND', (0, 2), (-1, 2), colors.palevioletred),
        # ('TEXTCOLOR', (0, 3), (-1, 3), colors.whitesmoke),
        ('ALIGN', (1, 1), (1, 1), 'CENTER'),
        ('ALIGN', (0, 0), (0, 0), 'RIGHT'),
        # ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        # ('FONTSIZE', (0, 2), (-1, 2), 20),
        ('BOTTOMPADDING', (0, 0), (0, 0), 10),
        # ('TOPPADDING', (0, 2), (-1, 2), 7),
        ('TOPPADDING', (0, 0), (0, 0), -100),
        # ('TOPPADDING', (0, -1), (-1, -1), 15),
        # ('SPAN', (0, -1), (-1, -1)),
        # ('FONTSIZE', (0, 3), (-1, -1), 10),
        ('BOTTOMPADDING', (0, 1), (0, 1), 20),
        ('GRID', (0, 2), (-1, -1), 0.25, colors.black),
    ])
    table = Table(lst, colWidths=(8*mm, None, None, 8*mm, 15*mm, None, None, None, None))
    table.setStyle(style)
    elems = []
    elems.append(table)
    pdf.build(elems)
    return FileResponse(open(filename, 'rb'), as_attachment=False, filename=filename)

def specialistReport(request,no):
    appntmnt = Appointment.objects.filter(specialist_specialist=no)
    x = datetime.now()
    dates = x.strftime("%B %d, %Y")
    head = ['Specialist Name','Service Categories','Appointment Id', 'Service Name', 'Appointment Date',]
    image = Image('http://127.0.0.1:8000/static/images/logos/logo.png',height=40,width=150, )
    lst = [[image],["Generate Date:-"],[dates], ['Services Provided By Specialist Report'], head]
    for item in appntmnt:
            lst.append([item.specialist_specialist,item.specialist_specialist.service_categories_service_categories_no1,item.appointment_id,item.services_service,item.appointment_date ])
    filename = 'SpecialistReport.pdf'
    pdf = SimpleDocTemplate(
        filename,
        pagesize=letter,
        title='Title here..'
    )
    style = TableStyle([
        ('SPAN', (0, 0), (0, 0)),
        ('SPAN', (0, 1), (0, 1)),
        # ('SPAN', (0, 2), (-1, 2)),
        # ('SPAN', (0, -1), (-1, -1)),
        ('FONTSIZE', (0, 3), (0, 3), 18),
        ('BACKGROUND', (0, 4), (-1, 4), colors.palevioletred),
        # ('TEXTCOLOR', (0, 3), (-1, 3), colors.whitesmoke),
        ('ALIGN', (-1, 0), (0, -1), 'RIGHT'),
        # ('ALIGN', (-1, -1), (-1, -1), 'RIGHT'),
        # ('VALIGN', (0, 3), (0, 3), 'MIDDLE'),
        # ('FONTSIZE', (0, 2), (-1, 2), 20),
        # ('BOTTOMPADDING', (0, 0), (0, 0), 10),
        # ('TOPPADDING', (0, 2), (-1, 2), 7),
        ('TOPPADDING', (0, 0), (0, 0), -100),
        # ('TOPPADDING', (0, -1), (-1, -1), 15),
        # ('SPAN', (0, -1), (-1, -1)),
        # ('FONTSIZE', (0, 3), (-1, -1), 10),
        # ('BOTTOMPADDING', (0, 1), (0, 1), 0),
        ('BOTTOMPADDING', (0, 3), (0, 3), 20),
        ('GRID', (0, 4), (-1, -1), 0.25, colors.black),
    ])
    table = Table(lst, colWidths=(30*mm, None, None, None, None))
    table.setStyle(style)
    elems = []
    elems.append(table)
    pdf.build(elems)
    return FileResponse(open(filename, 'rb'), as_attachment=False, filename=filename)