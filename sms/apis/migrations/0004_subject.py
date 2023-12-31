# Generated by Django 4.2.6 on 2023-10-19 18:53

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('apis', '0003_alter_classroom_students'),
    ]

    operations = [
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('students', models.ManyToManyField(limit_choices_to={'user_type': 'student'}, related_name='learning_subjects', to=settings.AUTH_USER_MODEL)),
                ('teachers', models.ManyToManyField(limit_choices_to={'user_type': 'teacher'}, related_name='teaching_subjects', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
