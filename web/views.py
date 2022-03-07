from django.shortcuts import render
from django.views import View
from django_request_mapping import request_mapping


@request_mapping('')
class MyView(View):

    @request_mapping('/')
    def home(self, request):
        return render(request, 'home.html')

    @request_mapping('/login')
    def login(self, request):
        return render(request, 'logins.html')

    @request_mapping('/register')
    def register(self, request):
        return render(request, 'register.html')


