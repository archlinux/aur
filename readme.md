
## Basic usage
The systemd service instance name is mapped to the video device number. So for example:

```sh
systemctl start fake-background-webcam@0.service
```

would use `/dev/video0` as the source and create `/dev/video20` as the virutal camera with fake background.

## Customization
Override the systemd unit file: 

```sh
systemctl edit fake-background-webcam@0.service 
#edit
systemctl daemon-reload
systemctl restart fake-background-webcam@0.service
```


```sh
[Service]
# Change folder with background/mask images and add additional arguments 
# See https://github.com/fangfufu/Linux-Fake-Background-Webcam#fakecamfakepy
Environment=IMAGE_FOLDER=/home/myBackground FAKE_BACKGROUND_WEBCAM_ARGS="--hologram --scale-factor 1"

# To avoid automatic loading/removing of the v4l2loopback kernel module
ExecStartPre=
ExecStartPost=

 
```

It is possible to have multiple cameras sharing the same bodypix detector. Only disable the `Pre/Post` commands (for all `@` instances) as shown above and load the modules manually. For example:

```sh
modprobe v4l2loopback video_nr=20,21 card_label="Fake Background cam1","Fake Background cam2" exclusive_caps=1

```
