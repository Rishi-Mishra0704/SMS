# Generated by Django 4.2.6 on 2023-10-19 18:31

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('apis', '0002_alter_classroom_teacher'),
    ]

    operations = [
        migrations.AlterField(
            model_name='classroom',
            name='students',
            field=models.ManyToManyField(limit_choices_to={'user_type': 'student'}, related_name='enrolled_classes', to=settings.AUTH_USER_MODEL),
        ),
    ]
