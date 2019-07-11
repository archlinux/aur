# netvfy-agent-git
ArchLinux AUR package for the netvfy command line agent

Installation
------------

```bash
yaourt -S netvfy-agent-git
sudo -i
netvfy-agent -k UUID
<CTRL-C>
systemctl enable netvfy-agent
systemctl start netvfy-agent
```

Should you choose to run the service as a different user than root, you need to run the following two commands

```bash
sudo chmod 666 /dev/net/tun
sudo setcap cap_net_bind_service,cap_net_admin=ep /usr/bin/netvfy-agent
```

Link to AUR https://aur.archlinux.org/packages/netvfy-agent-git/
