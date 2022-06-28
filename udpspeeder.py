import json
import sys
import subprocess

conf=json.load(open(sys.argv[1]))

if conf['runmode']=="server":
    args="-s"
elif conf['runmode']=="client":
    args="-c"
else:
    raise Exception("runmode must be server or client")

args=args+" -l "+conf['local']
args=args+" -r "+conf['remote']

if conf['key']!="":
    args=args+" --key "+conf['key']

for key in ['fec','timeout']:
    args=args+" --"+key+" "+conf[key]

if conf["report"]>0:
    args=args+" --report "+str(conf['report'])

for key in ['mode','mtu','jitter','interval','random-drop']:
    args=args+" --"+key+" "+conf[key]

if conf['disable-obscure']==True:
    args=args+" --disable-obscure"

if conf['disable-checksum']==True:
    args=args+" --disable-checksum"

if conf["fifo"]!="":
    args=args+" --fifo "+conf["fifo"]

for key in ['queue-len','decode-buf','delay-capacity']:
    args=args+" --"+key+" "+conf[key]

if conf['disable-fec']==True:
    args=args+" --disable-fec"

args=args+" --sock-buf "+conf['sock-buf']

if conf["out-addr"]!="":
    args=args+" --out-addr "+conf["out-addr"]

if conf["out-interface"]!="":
    args=args+" --out-interface "+conf["out-interface"]

args=args+" --log-level "+conf['log-level']

if conf["log-position"]==True:
    args=args+" --log-position"

if conf['disable-color']==True:
    args=args+" --disable-color"

subprocess.call("speederv2 "+args,shell=True)


