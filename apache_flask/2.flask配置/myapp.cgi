#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from myapp import app

CGIHandler().run(app)