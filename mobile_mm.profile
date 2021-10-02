Description='Example of a mobile broadband connection profile'
Connection=mobile_mm

# The Wireless WAN interface provided by the modem
Interface=wwp0s20u4

# Block/unblock your radio
#RFKill=tpacpi_wwan_sw

# IPv6 currently only supports 'dhcp' (default: no)
#IP6=no

# Use the default route provided by the peer (default: true)
#DefaultRoute=false

# Use DNS provided by the peer (default: true)
#UsePeerDNS=true
# As an alternative you can, set your nameservers using the option below
#DNS=('1.1.1.1' '2606:4700:4700::1111')

# Providing user and password are not always required
#User='example@yourprovider.com'
#Password='very secret'

# Access point you are connecting to
AccessPointName=apn

# If your device has a PIN code, set it here
#Pin=

# You can also add your PIN2/PUK code.
# If your device is PUK-locked, we will try to unlock it
#Puk=

#The number to dial (default: *99#)
#PhoneNumber=*99***1#

# Enable/Disable roaming (default: no)
#Roaming=yes

# Amount of seconds, we will wait until initialisation of the modem will be interrupted (default: 15)
#TimeoutModem=5

# Amount of seconds, we will wait for the connection is established (default: 30)
#TimeoutConnect=35

# Preferred mode can be one of {ANY, 2G, 3G, 4G} (default: 4G)
#Mode=4G
