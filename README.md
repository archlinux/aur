## Install (Arch)
```sh
paru -S thinkpad_utils-git
```

Edit config:
```sh
sudo nano /etc/thinkpad_utils.conf
```

Set `LOCK_USER` to your username. Save, then reinstall:
```sh
paru -S thinkpad_utils-git
```

Enable service:
```sh
sudo systemctl enable --now thinkpad_utils
```

Done.
