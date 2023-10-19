from django.db import models
from core.models import CustomUser

class Classroom(models.Model):
    teacher = models.ForeignKey(
        CustomUser,
        on_delete=models.CASCADE,
        related_name='teaching_classes',
        limit_choices_to={'user_type': 'teacher'}
    )
    students = models.ManyToManyField(CustomUser, related_name='enrolled_classes')

    def __str__(self):
        return f"Classroom with Teacher: {self.teacher.username}"
