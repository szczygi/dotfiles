#!/usr/bin/env python

import socket
ip = socket.gethostbyname(socket.gethostname())

if ip == "192.168.2.27":
    print("%{F#8bbcd2}%{F-} LTE") 
elif ip == "192.168.2.28":
    print("%{F#e89a00}%{F-} ADSL")
else:
    print("%{F#a0d18a}%{F-}", ip)
