# netvirt-agent-git
ArchLinux AUR package for the netvirt CLI agent

Installation
------------

```bash
yaourt -S netvirt-agent-git
sudo -i
netvirt-agent -k UUID
<CTRL-C>
systemctl enable netvirt-agent
systemctl start netvirt-agent
```

Should you choose to run the service as a different user than root, you need to run the following two commands

```bash
sudo chmod 666 /dev/net/tun
sudo setcap cap_net_bind_service,cap_net_admin=ep /usr/bin/netvirt-agent
```

Link to AUR https://aur.archlinux.org/packages/netvirt-agent-git/
