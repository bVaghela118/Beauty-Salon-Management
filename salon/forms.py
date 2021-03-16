from django import forms
from .models import Appointment,Specialist,AuthUser

class Appoint(forms.ModelForm):
    specialist_id = forms.ModelChoiceField(queryset= Specialist.objects.all(), label="Post", widget=forms.RadioSelect(), initial=0)
    class Meta:
        model = Appointment
        fields = ["specialist_specialist","auth_user"]
