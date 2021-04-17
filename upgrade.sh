#/bin/sh

python /var/lib/netbox/manage.py migrate
python /var/lib/netbox/manage.py trace_paths --no-input
python /var/lib/netbox/manage.py collectstatic --noinput
python /var/lib/netbox/manage.py remove_stale_contenttypes --no-input
python /var/lib/netbox/manage.py clearsessions
python /var/lib/netbox/manage.py invalidate all
