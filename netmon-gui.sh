#!/bin/sh
# exec -a بيضبط اسم الـ process عشان الـ WM_CLASS يبقى netmon-gui
exec -a netmon-gui /usr/bin/python -m netmon "$@"
