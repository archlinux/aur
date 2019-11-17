import json
import os
from wsgidav.wsgidav_app import WsgiDAVApp

with open(os.environ.get("WSGIDAV_CONFIG_FILE", "/etc/wsgidav/config.json"), mode="r", encoding="utf-8") as json_file:
    json_config = json.load(json_file)

app = WsgiDAVApp(json_config)
