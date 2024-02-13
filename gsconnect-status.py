#! python3
from pydbus import SessionBus
import json

session_bus = SessionBus()
proxy_gsconnect = session_bus.get(
    'org.gnome.Shell.Extensions.GSConnect',
    '/org/gnome/Shell/Extensions/GSConnect')
gsconnect = proxy_gsconnect[
    'org.freedesktop.DBus.ObjectManager']

waybar = {'text': "", 'tooltip': "", "class": "GSdevices", "types": ""}

icons = {'smartphone-symbolic': "", "tablet-symbolic": "",
         'tv-symbolic': "", 'computer-symbolic': ""}

types = []
devices = gsconnect.GetManagedObjects()
for dev in devices:
    devinfo = devices[dev]['org.gnome.Shell.Extensions.GSConnect.Device']
    if devinfo['Connected']:
        if devinfo['Paired']:
            types.append(devinfo['Type'])
            waybar['text'] += icons[devinfo['IconName']] + ' '
            waybar['tooltip'] += devinfo['Name'] + '\n'
        if not devinfo['Paired']:
            types.append(devinfo['Type'])
            waybar['text'] += ' ' + ' '
            waybar['tooltip'] += devinfo['Name'] + '\n'

waybar['types'] = '+'.join(types)
for key in waybar:
    waybar[key] = waybar[key].strip()

print(json.dumps(waybar))
