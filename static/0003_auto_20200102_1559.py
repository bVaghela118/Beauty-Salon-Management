# Generated by Django 2.2.7 on 2020-01-02 10:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('salon', '0002_auto_20200102_1556'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='appointment',
            options={'managed': False},
        ),
        migrations.AlterModelTable(
            name='authuser',
            table=None,
        ),
    ]
