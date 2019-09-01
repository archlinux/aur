d /var/lib/coolq 0755 coolq coolq
d /var/lib/coolq/app 0755 coolq coolq
d /var/lib/coolq/data 0755 coolq coolq
d /var/lib/coolq/data/app 0755 coolq coolq
d /var/cache/coolq 0755 coolq coolq
d /var/log/coolq 0755 coolq coolq
d /var/log/coolq/app 0755 coolq coolq

d /var/cache/coolq/tmp 0755 coolq coolq
d /var/cache/coolq/bface 0755 coolq coolq
d /var/cache/coolq/image 0755 coolq coolq
d /var/cache/coolq/record 0755 coolq coolq
d /var/cache/coolq/show 0755 coolq coolq
L /var/lib/coolq/data/tmp 0755 coolq coolq - /var/cache/coolq/tmp
L /var/lib/coolq/data/bface 0755 coolq coolq - /var/cache/coolq/bface
L /var/lib/coolq/data/image 0755 coolq coolq - /var/cache/coolq/image
L /var/lib/coolq/data/record 0755 coolq coolq - /var/cache/coolq/record
L /var/lib/coolq/data/show 0755 coolq coolq - /var/cache/coolq/show

L /var/lib/coolq/data/log 0755 coolq coolq - /var/log/coolq
