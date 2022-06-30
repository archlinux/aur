import os
import yaml
import time

with open(os.path.dirname(os.path.abspath(__file__)) + '/' + 'config.yaml', encoding='utf-8') as co:
    data = yaml.safe_load(co)
co.close()

keep = int(data['keep']) - 1
current = data['data']
vgname = data['vgname']
lvname = data['lvname']
snapsize = data['snapsize']
snapname = data['snapname']

lvaddr = '/dev/' + vgname + '/'

while len(current) > keep:
    if len(current) > keep:
        os.system('sudo lvremove ' + lvaddr + snapname + '-' + str(current[0]) + ' -y')
        current.remove(current[0])

tmp = os.popen('date +%s')
now_time = tmp.read().replace("\n","")
tmp.close()


if len(current) <= keep and now_time not in current:
    os.system('sudo lvcreate --size ' + snapsize + ' --snapshot' + ' --name ' + snapname + '-' + now_time + ' ' + lvaddr + lvname)
    current.append(now_time)

data['data'] = current
with open(os.path.dirname(os.path.abspath(__file__)) + '/' + 'config.yaml', 'w', encoding='utf-8') as co:
    yaml.dump(data, co)

co.close()



