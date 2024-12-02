
## Basic usage
The systemd service instance name is mapped to the video device number. So for example:

```sh
systemctl start lfbw@0.service
```

would use `/dev/video0` as the source and create `/dev/video20` as the virtual camera with fake background.

## Customization
Edit the `/etc/lfbw/config.ini` and restart the systemd service.

The `background-image` can be changed there instead of customizing the systemd unit file.

### Multiple cameras
Override the systemd unit file:

```sh
systemctl edit lfbw@0.service
#edit
systemctl daemon-reload
systemctl restart lfbw@0.service
```


```sh
[Service]

# To disable automatic loading/removing of the v4l2loopback kernel module completely
ExecStartPre=
ExecStartPost= 
```

It is then possible to for example handle multiple cameras by loading the module manually with custom parameters:

```sh
modprobe v4l2loopback video_nr=20,21 card_label="Fake Background cam1","Fake Background cam2" exclusive_caps=1

```

```sh
systemctl start lfbw@{0,1}.service
```

