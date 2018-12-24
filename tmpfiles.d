#Type Path        Mode UID  GID  Age Argument
d /etc/thelounge 0755 thelounge thelounge
d /etc/thelounge/users 0755 thelounge thelounge
z "/etc/thelounge/users/*" 0640 thelounge thelounge
z /etc/thelounge/config.js - thelounge thelounge
d /var/lib/thelounge 0755 thelounge thelounge
L /var/lib/thelounge/users - thelounge thelounge - /etc/thelounge/users
L /var/lib/thelounge/config.js - thelounge thelounge - /etc/thelounge/config.js
