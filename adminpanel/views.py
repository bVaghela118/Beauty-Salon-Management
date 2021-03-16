# from django.shortcuts import render, redirect
# from django.contrib.auth.models import User, auth
# from django.contrib import messages
#
#
# def index(request):
#     return render(request, "index.html")
#
# # def register(request):
# #     if request.method == 'POST':
# #         first_name = request.POST['first_name']
# #         last_name = request.POST['last_name']
# #         username = request.POST['username']
# #         password1 = request.POST['password1']
# #         password2 = request.POST['password2']
# #         email = request.POST['email']
# #
# #         if password1 == password2:
# #             if User.objects.filter(username=username).exists():
# #                 messages.info(request,'User name taken')
# #                 return redirect('register')
# #                 #print('Username is already exist')
# #             else:
# #                  user = User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name)
# #                  user.save();
# #                  print('User created')
# #                #  return redirect(request,"login")
# #         else:
# #             messages.info(request, "Password is Incorrect")
# #             return redirect('register')
# #         return redirect('/')
# #     else:
# #         return render(request, 'register.html')
# #
# # def login(request):
# #     if request.method == "POST":
# #         username = request.POST['username']
# #         password = request.POST['password']
# #         user = auth.authenticate(username=username, password=password)
# #
# #         if user is not None:
# #             auth.login(request, user)
# #             print("Login succesfully")
# #             messages.info(request, "contact.html")
# #             return redirect('/')
# #         else:
# #             messages.info(request, "Invalid username or password")
# #             return redirect("login")
# #     else:
# #         return render(request, "login.html")
# #
# # def about(request):
# #     return render(request, "about.html")
# #
# def service_category(request):
#      # ser_cat = ServiceCategories.objects.all()
#      # context = {"Category": ser_cat}
#      return render(request, "service_category.html")
#
# #
# # def service(request):
# #     return render(request, "service.html")
# #
# # def specialist(request):
# #     return render(request,"addspecialist.html")
#
# def calendar(request):
#     return render(request, "calendar.html")
#
# def tables(request):
#     return render(request, "tables.html")
#
# def form(requset):
#     return render(requset,"form.html")
#
# def login(request):
#     if request.method == "POST":
#         username = request.POST['username']
#         password = request.POST['password']
#         user = auth.authenticate(username=username, password=password)
#
#         if user is not None:
#             auth.login(request, user)
#             #print("Login succesfully")
#             messages.info(request, "")
#             return redirect('/index/')
#         else:
#             messages.info(request, "Invalid username or password")
#             return redirect("login")
#     else:
#         return render(request, "login.html")
#
# def register(request):
#     if request.method == 'POST':
#         first_name = request.POST['first_name']
#         last_name = request.POST['last_name']
#         username = request.POST['username']
#         password1 = request.POST['password1']
#         password2 = request.POST['password2']
#         email = request.POST['email']
#
#         if password1 == password2:
#             if User.objects.filter(username=username).exists():
#                 messages.info(request,'User name taken')
#                 return redirect('register')
#                 #print('Username is already exist')
#             else:
#                  user = User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name)
#                  user.save();
#                  print('User created')
#                #  return redirect(request,"login")
#         else:
#             messages.info(request, "Password is Incorrect")
#             return redirect('register')
#         return redirect('/')
#     else:
#         return render(request, 'register.html')
