import json
import os
from wsgidav.wsgidav_app import DEFAULT_CONFIG, WsgiDAVApp

with open(os.environ.get("WSGIDAV_CONFIG_FILE", "/etc/wsgidav/config.json"), mode="r", encoding="utf-8") as json_file:
    json_config = json.load(json_file)

config = DEFAULT_CONFIG.copy()
config.update(json_config)

app = WsgiDAVApp(config)
