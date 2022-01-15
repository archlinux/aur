import os

addr = "http://0.0.0.0:27701/" # put your server address here
os.environ["SYNC_ENDPOINT"] = addr + "sync/"
os.environ["SYNC_ENDPOINT_MEDIA"] = addr + "msync/"
