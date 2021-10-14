from django.http.response import HttpResponse
from django.shortcuts import render
from sawo import createTemplate, getContext, verifyToken
import json;
import os

# Create your views here.

load = ''
loaded = 0


def setPayload(payload):
    global load
    load = payload

def setLoaded(reset=False):
    global loaded
    if reset:
        loaded=0
    else:
        loaded+=1

createTemplate("templates/partials")

def index(request):
    return render(request,"index.html")

def login(request):
    setLoaded()
    setPayload(load if loaded<2 else '')
    print(os.environ.get('api_key'))
    config = {
                "auth_key": os.environ.get('api_key'),
                "identifier": "email",
                "to": "receive"
    }
    context = {"sawo":config,"load":load,"title":"Home"}
    
    return render(request,"login.html", context)

def receive(request):
    if request.method == 'POST':
        payload = json.loads(request.body)["payload"]
        setLoaded(True)
        setPayload(payload)
        print(payload)
        
        status = 200 if verifyToken(payload) else 404
        print(status)
        response_data = {"status":status}
        return HttpResponse(json.dumps(response_data), content_type="application/json")

