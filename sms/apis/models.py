from django.db import models
from core.models import CustomUser

class Classroom(models.Model):
    teacher = models.ForeignKey(
        CustomUser,
        on_delete=models.CASCADE,
        related_name='teaching_classes',
        limit_choices_to={'user_type': 'teacher'}
    )
    students = models.ManyToManyField(CustomUser, related_name='enrolled_classes', limit_choices_to={'user_type': 'student'})

    def __str__(self):
        return f"Classroom with Teacher: {self.teacher.username}"
    


class Subject(models.Model):
    name = models.CharField(max_length=100, unique=True)

    # Teachers who can teach this subject
    teachers = models.ManyToManyField(
        CustomUser,
        related_name='teaching_subjects',
        limit_choices_to={'user_type': 'teacher'},
    )

    # Students who can learn this subject
    students = models.ManyToManyField(
        CustomUser,
        related_name='learning_subjects',
        limit_choices_to={'user_type': 'student'},
    )

    def __str__(self):
        return self.name  
