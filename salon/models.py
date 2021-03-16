from _pydecimal import Decimal
from django.db import models
from django.forms import TimeInput
from django.utils.safestring import mark_safe
from django.forms import fields

report_builder_model_manager = 'on_site'


class Appointment(models.Model):
    objects = None
    appointment_id = models.AutoField(primary_key=True)
    appointment_date = models.DateField(blank=True, null=True)
    appointment_time = models.TimeField(blank=True, null=True)
    appointment_status = models.BooleanField(blank=True, null=True)
    specialist_specialist = models.ForeignKey('Specialist', models.DO_NOTHING)
    auth_user = models.ForeignKey('AuthUser', models.DO_NOTHING)
    services_service = models.ForeignKey('Services', models.DO_NOTHING, blank=True, null=True)
    package_package = models.ForeignKey('Package', models.DO_NOTHING, db_column='package_package', blank=True,
                                        null=True)

    class Meta:
        # managed = False
        db_table = 'appointment'
        verbose_name_plural = 'Appointment'
        # def get_absolute_url(self):

    #     return reversed("accept_bid",kwargs={"appointment_id"})

    def link(self):
        url = '/report/appointment_status/%d' % (self.appointment_status)
        return mark_safe('<a class="grp-button" href="%s">Report</a>' % (url))


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class ReportBuilder:
    exclude = ()  # Lists or tuple of excluded fields
    fields = ()  # Explicitly allowed fields
    extra = ()  # List extra fields (useful for methods)


class Salon(models.Model):
    objects = None
    salon_id = models.AutoField(db_column='Salon_id', primary_key=True)  # Field name made lowercase.
    salon_name = models.TextField(db_column='Salon_Name')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=200)  # Field name made lowercase.
    contact_no = models.BigIntegerField(db_column='Contact_no')  # Field name made lowercase.
    salon_email = models.TextField(db_column='Salon_Email', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'salon'
        verbose_name_plural = 'Salon'

    def __str__(self):
        return self.salon_name


class MembershipType(models.Model):
    objects = None
    membership_type_id = models.AutoField(primary_key=True)
    membership_name = models.CharField(max_length=50, blank=True, null=True)
    membership_duration = models.IntegerField(blank=True, null=True)
    membership_fees = models.IntegerField(blank=True, null=True)
    payment_type = models.CharField(max_length=50, null=True)
    salon_salon = models.ForeignKey('Salon', models.DO_NOTHING,
                                    db_column='salon_Salon_id')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'membership_type'
        verbose_name_plural = 'Membership'

    def __str__(self):
        return self.membership_name


class AuthUser(models.Model):
    objects = None
    password = models.CharField(max_length=8)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=15)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(max_length=254)
    contact_no = models.CharField(max_length=15, blank=True, null=True)
    cust_member_start_date = models.DateTimeField(blank=True, null=True)
    cust_member_end_date = models.DateTimeField(blank=True, null=True)
    is_staff = models.IntegerField(null=True)
    is_active = models.IntegerField(null=True)
    date_joined = models.DateTimeField(null=True)
    membership_type_membership_type = models.ForeignKey('MembershipType', models.DO_NOTHING,
                                                        db_column='membership_type_membership_type', blank=True,
                                                        null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'
        verbose_name_plural = "Auth User"

    def __str__(self):
        return self.username


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Cart(models.Model):
    objects = None
    prod_qty = models.IntegerField()
    total_price = models.FloatField()
    product_product = models.ForeignKey('Product', models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'cart'
        unique_together = (('product_product', 'user'),)
        verbose_name_plural = 'Cart'
    # @property
    # def totalprice(self):
    #     return self.prod_qty.aggregate(
    #         total_price=Sum(F('prod_qty') * F('prod_price'))
    #     )['total_price'] or Decimal('0')


class Dealer(models.Model):
    dealer_id = models.AutoField(primary_key=True)
    dealer_name = models.CharField(max_length=45, blank=True, null=True)
    dealer_contact_no = models.CharField(max_length=15, blank=True, null=True)
    dealer_address = models.CharField(max_length=45, blank=True, null=True)
    salon_salon = models.ForeignKey('Salon', models.DO_NOTHING,
                                    db_column='salon_Salon_id')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'dealer'
        verbose_name_plural = 'Dealer'

    def __str__(self):
        return self.dealer_name


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Feedback(models.Model):
    objects = None
    feedback_id = models.AutoField(primary_key=True)
    feedback_desc = models.CharField(max_length=250, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    services_service = models.ForeignKey('Services', models.DO_NOTHING, db_column='Services_service_id', blank=True,
                                         null=True)  # Field name made lowercase.
    product_product = models.ForeignKey('Product', models.DO_NOTHING, blank=True, null=True)
    specialist_specialist = models.ForeignKey('Specialist', models.DO_NOTHING, blank=True, null=True)
    auth_user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'feedback'
        verbose_name_plural = "feedback"


class Gallary(models.Model):
    objects = None
    image_id = models.AutoField(primary_key=True)
    image_url = models.ImageField(upload_to='photos/')
    auth_user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    def photo(self):
        return mark_safe('<img src="{}" height="50" width ="100"/>'.format(self.image_url.url))

    photo.short_description = 'Image'
    photo.allow_tags = True

    class Meta:
        # managed = False
        db_table = 'gallary'
        verbose_name_plural = "Gallary"


class Offers(models.Model):
    offer_id = models.AutoField(primary_key=True)
    offers_start_date = models.DateField(blank=True, null=True)
    offers_end_date = models.DateField(blank=True, null=True)
    offer_code = models.CharField(max_length=25)
    discount = models.FloatField(blank=True, null=True)
    membership_type_membership_type = models.ForeignKey(MembershipType, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'offers'
        verbose_name_plural = 'Offer'

    def __int__(self):
        return self.offer_id


class Package(models.Model):
    objects = None
    package_id = models.AutoField(primary_key=True)
    package_name = models.CharField(max_length=45)
    package_start_dt = models.DateField(blank=True, null=True)
    package_end_dt = models.DateField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'package'
        verbose_name_plural = 'Package'

    def __str__(self):
        return self.package_name

    def services(self):
        service = Services.objects.get(id=self.package_id)
        details = Packageservices.objects.filter(package_package=service)
        return details

    def link(self):
        url = '/admin/salon/packageservices/?package_package__package_id__exact=%d' % (self.package_id)
        return mark_safe('<a class="grp-button" href="%s">View Services</a>' % (url))


class Packageservices(models.Model):
    objects = None
    package_package = models.ForeignKey(Package, models.DO_NOTHING, primary_key=True)
    services_service = models.ForeignKey('Services', models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'packageservices'
        unique_together = (('package_package', 'services_service'),)
        verbose_name_plural = "Package Services"


class Product(models.Model):
    objects = None
    product_id = models.AutoField(primary_key=True)
    product_name = models.TextField(blank=True, null=True)
    product_price = models.IntegerField(blank=True, null=True)
    product_url = models.ImageField(upload_to='prod_image/')
    product_desc = models.CharField(max_length=500, blank=True, null=True)
    qty = models.IntegerField(blank=True, null=True)
    product_categories_product_categories = models.ForeignKey('ProductCategories', models.DO_NOTHING,
                                                              db_column='Product_categories_Product_categories_id')  # Field name made lowercase.
    offers_offer = models.ForeignKey(Offers, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'product'
        verbose_name_plural = 'Product'

    def photo(self):
        return mark_safe('<img src="{}" height="50" width ="100"/>'.format(self.product_url.url))

    photo.short_description = 'Image'
    photo.allow_tags = True

    def __str__(self):
        return self.product_name


class ProductCategories(models.Model):
    objects = None
    product_categories_id = models.AutoField(db_column='Product_categories_id',
                                             primary_key=True)  # Field name made lowercase.
    product_categories_name = models.CharField(db_column='Product_categories_name', max_length=45, blank=True,
                                               null=True)  # Field name made lowercase.
    salon_salon = models.ForeignKey('Salon', models.DO_NOTHING,
                                    db_column='salon_Salon_id')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'product_categories'
        verbose_name_plural = 'Product Categories'

    def __str__(self):
        return self.product_categories_name

    def product(self):
        prod = ProductCategories.objects.get(id=self.product_categories_id)
        product = Product.objects.filter(product_categories_product_categories=prod)
        return product

    def link(self):
        url = '/admin/salon/product/?product_categories_product_categories__product_categories_id__exact=%d' % (
            self.product_categories_id)
        return mark_safe('<a class="grp-button" href="%s">View Products</a>' % (url))


class Purchase(models.Model):
    objects = None
    purchase_id = models.AutoField(db_column='Purchase_id', primary_key=True)  # Field name made lowercase.
    purchase_date = models.DateField(db_column='Purchase_date', blank=True, null=True)  # Field name made lowercase.
    purchase_amount = models.IntegerField(db_column='Purchase_Amount', blank=True,
                                          null=True)  # Field name made lowercase.
    dealer_dealer = models.ForeignKey(Dealer, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'purchase'
        verbose_name_plural = 'Purchase'

    def __int__(self):
        return self.purchase_amount

    def purchasedetails(self):
        purchase = Purchase.objects.get(id=self.purchase_id)
        details = PurchaseDetails.objects.filter(purchase_purchase=purchase)
        return details

    def link(self):
        url = '/admin/salon/purchasedetails/?purchase_purchase__purchase_id__exact=%d' % (self.purchase_id)
        return mark_safe('<a class="grp-button" href="%s">View Product</a>' % (url))


class PurchaseDetails(models.Model):
    objects = None
    product_product = models.ForeignKey(Product, models.DO_NOTHING)
    purchase_purchase = models.ForeignKey(Purchase, models.DO_NOTHING, db_column='Purchase_Purchase_id',
                                          primary_key=True)  # Field name made lowercase.
    prod_qty = models.IntegerField(db_column='Prod_qty', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'purchase_details'
        unique_together = (('product_product', 'purchase_purchase'),)
        verbose_name_plural = 'Purchase Details'


class PurchaseReturn(models.Model):
    purchase_return_id = models.AutoField(db_column='Purchase_return_id',
                                          primary_key=True)  # Field name made lowercase.
    purchase_return_date = models.DateField(db_column='Purchase_return_date', blank=True,
                                            null=True)  # Field name made lowercase.
    purchase_return_amount = models.IntegerField(db_column='Purchase_return_amount', blank=True,
                                                 null=True)  # Field name made lowercase.
    purchase_purchase = models.ForeignKey(Purchase, models.DO_NOTHING,
                                          db_column='Purchase_Purchase_id')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'purchase_return'
        verbose_name_plural = 'Purchase return'


class PurchaseReturnDetails(models.Model):
    purchase_return_purchase_return = models.ForeignKey(PurchaseReturn, models.DO_NOTHING,
                                                        db_column='Purchase_return_Purchase_return_id',
                                                        primary_key=True)  # Field name made lowercase.
    product_product = models.ForeignKey(Product, models.DO_NOTHING)
    purchase_return_qty = models.IntegerField(db_column='Purchase_return_qty', blank=True,
                                              null=True)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'purchase_return_details'
        unique_together = (('purchase_return_purchase_return', 'product_product'),)
        verbose_name_plural = 'Purchase return details'


class Rating(models.Model):
    rating = models.IntegerField(db_column='Rating', blank=True, null=True)  # Field name made lowercase.
    user_user_id = models.IntegerField(db_column='User_user_id')  # Field name made lowercase.
    product_product = models.ForeignKey(Product, models.DO_NOTHING)
    auth_user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'rating'
        verbose_name_plural = 'Rating'


class Sales(models.Model):
    objects = None
    sales_id = models.AutoField(primary_key=True)
    address = models.CharField(max_length=500)
    phone = models.CharField(max_length=15)
    city = models.CharField(max_length=15)
    state = models.CharField(max_length=15)
    pincode = models.IntegerField(max_length=6)
    email_id = models.CharField(max_length=50)
    sales_date = models.DateField(db_column='Sales_date', blank=True, null=True)  # Field name made lowercase.
    payment = models.CharField(db_column='Payment', max_length=50, blank=True, null=True)  # Field name made lowercase.
    auth_user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'sales'
        verbose_name_plural = 'Sales Order'

    def salesdetails(self):
        sale = Sales.objects.get(id=self.sales_id)
        details = SalesDetail.objects.filter(sales_sales=sale)
        return details

    def link(self):
        url = '/admin/salon/salesdetail/?sales_sales__sales_id__exact=%d' % (self.sales_id)
        return mark_safe('<a class="grp-button" href="%s">View Product</a>' % (url))


class SalesDetail(models.Model):
    objects = None
    product_product = models.ForeignKey(Product, models.DO_NOTHING, primary_key=True)
    sales_sales = models.ForeignKey(Sales, models.DO_NOTHING, db_column='Sales_sales_id')  # Field name made lowercase.
    qty_order = models.IntegerField(blank=True, null=True)
    sales_price = models.IntegerField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'sales_detail'
        unique_together = (('product_product', 'sales_sales'),)
        verbose_name_plural = 'Sales details'

    # def __int__(self):
    #     return self.sales_sales

    def Report(self):
        url = '/salesReport/%d' % (self.sales_sales.sales_id)
        return mark_safe('<a class="grp-button" href="%s">View Report</a>' % (url))


class SalesReturn(models.Model):
    sales_return_id = models.AutoField(db_column='Sales_return_id', primary_key=True)  # Field name made lowercase.
    sales_return_date = models.DateField(db_column='Sales_return_date', blank=True,
                                         null=True)  # Field name made lowercase.
    sales_return_total_amount = models.IntegerField(db_column='Sales_return_total_amount', blank=True,
                                                    null=True)  # Field name made lowercase.
    sales_sales = models.ForeignKey(Sales, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'sales_return'
        verbose_name_plural = 'Sales return'


class SalesReturnDetails(models.Model):
    product_product = models.ForeignKey(Product, models.DO_NOTHING, primary_key=True)
    sales_return_sales_return = models.ForeignKey(SalesReturn, models.DO_NOTHING,
                                                  db_column='Sales_return_Sales_return_id')  # Field name made lowercase.
    sales_return_qty = models.IntegerField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'sales_return_details'
        unique_together = (('product_product', 'sales_return_sales_return'),)
        verbose_name_plural = 'Sales return details'


class ServiceCategories(models.Model):
    objects = None
    service_categories_no = models.AutoField(primary_key=True)
    service_categories_name = models.CharField(max_length=45, blank=True, null=True)
    salon_salon = models.ForeignKey(Salon, models.DO_NOTHING, db_column='salon_Salon_id')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'service_categories'
        verbose_name_plural = 'Service Categories'

    def __str__(self):
        return self.service_categories_name

    def service(self):
        ser = ServiceCategories.objects.get(id=self.service_categories_no)
        service = Services.objects.filter(service_categories_service_categories_no=ser)
        return service

    def link(self):
        url = '/admin/salon/services/?q=&service_categories_service_categories_no__service_categories_no__exact=%d' % (
            self.service_categories_no)
        return mark_safe('<a class="grp-button" href="%s">View Services</a>' % (url))


class ServiceGiven(models.Model):
    objects = None
    service_given_id = models.AutoField(primary_key=True)
    service_date = models.DateField(blank=True, null=True)
    amount = models.IntegerField(blank=True, null=True)
    appointment_appointment = models.ForeignKey(Appointment, models.DO_NOTHING)
    auth_user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    package_package = models.ForeignKey(Package, models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'service_given'
        verbose_name_plural = 'Service Given'


class ServiceGivenDetails(models.Model):
    services_service = models.ForeignKey('Services', models.DO_NOTHING, db_column='Services_service_id',
                                         primary_key=True)  # Field name made lowercase.
    service_given_service_given = models.ForeignKey(ServiceGiven, models.DO_NOTHING)
    specialist_specialist = models.ForeignKey('Specialist', models.DO_NOTHING)

    class Meta:
        # managed = False
        db_table = 'service_given_details'
        unique_together = (('services_service', 'service_given_service_given'),)
        verbose_name_plural = 'Service Given Detail'


class Services(models.Model):
    objects = None
    service_id = models.AutoField(primary_key=True)
    service_name = models.TextField(db_column='Service_name', blank=True, null=True)  # Field name made lowercase.
    services_url = models.ImageField(upload_to='service')
    service_duration = models.CharField(db_column='Service_duration', max_length=20, blank=True,
                                        null=True)  # Field name made lowercase.
    service_rate = models.IntegerField(db_column='Service_rate', blank=True, null=True)  # Field name made lowercase.
    service_categories_service_categories_no = models.ForeignKey(ServiceCategories, models.DO_NOTHING,
                                                                 db_column='service_categories_service_categories_no')
    offers_offer = models.ForeignKey(Offers, models.DO_NOTHING, blank=True, null=True)

    def pics(self):
        return mark_safe('<img src="{}" height="50" width ="100"/>'.format(self.services_url.url))

    pics.short_description = 'Image'
    pics.allow_tags = True

    class Meta:
        # managed = False
        db_table = 'services'
        unique_together = (('service_id', 'service_categories_service_categories_no'),)
        verbose_name_plural = 'Services'

    def __str__(self):
        return self.service_name


class Specialist(models.Model):
    objects = None
    specialist_id = models.AutoField(primary_key=True)
    specialist_name = models.CharField(max_length=45, blank=True, null=True)
    gender = models.IntegerField(blank=True, null=True)
    contact = models.CharField(max_length=15, blank=True, null=True)
    service_categories_service_categories_no1 = models.ForeignKey(ServiceCategories, models.DO_NOTHING,
                                                                  db_column='service_categories_service_categories_no1')
    salon_salon = models.ForeignKey(Salon, models.DO_NOTHING, db_column='salon_Salon_id')  # Field name made lowercase.
    specialist_image = models.ImageField(upload_to='specialist')

    class Meta:
        # managed = False
        db_table = 'specialist'
        verbose_name_plural = 'Specialist'

    def __str__(self):
        return '{}'.format(self.specialist_name)

    def pics(self):
        return mark_safe('<img src="{}" height="50" width ="100"/>'.format(self.specialist_image.url))

    pics.short_description = 'Image'
    pics.allow_tags = True

    def Report(self):
        url = '/specialistReport/%d' % (self.specialist_id)
        return mark_safe('<a class="grp-button" href="%s">Report</a>' % (url))

