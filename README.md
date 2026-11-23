# Plasma Notification Mirror

[Plasma Notification Mirror](https://github.com/MysteriousAeon/plasma-notification-mirror) mirrors desktop notification popups to additional displays in KDE Plasma on Wayland.

## Start mirroring

Run these commands in a terminal in your Plasma session:

```sh
systemctl --user daemon-reload
systemctl --user enable --now plasma-notification-mirror.service
```

The default settings place mirrored notifications in the bottom-right corner of the first secondary display.

Send a sample notification with `notify-send`, provided by `libnotify`:

```sh
notify-send -i dialog-information "Mirror test" "Hello from Plasma Notification Mirror"
```

Hover over a mirrored popup to pause its countdown. Click its close button to dismiss it.

## Configuration

Copy the example configuration:

```sh
mkdir -p ~/.config/plasma-notification-mirror
cp -i /usr/share/plasma-notification-mirror/config.example.ini \
  ~/.config/plasma-notification-mirror/config.ini
```

Edit `~/.config/plasma-notification-mirror/config.ini`, then restart the service to apply your changes:

```sh
systemctl --user restart plasma-notification-mirror.service
```

### Choose displays

Set `mode` in the `[General]` section:

| Mode | Displays receiving mirrored notifications |
| --- | --- |
| `secondary` | The first secondary display; the default. |
| `all-secondary` | Every secondary display. |
| `screens` | The displays listed in `screens`. |
| `primary` | The primary display. |
| `all` | Every display. |

List the display names available in your session:

```sh
kscreen-doctor -o
```

To choose specific displays, use their names in a quoted, comma-separated list:

```ini
[General]
mode=screens
screens="HDMI-A-1,DP-1"
```

Replace the example names with the display names from your session.

### Adjust popups

Add appearance and timing settings to the same `[General]` section. For example:

```ini
[General]
mode=secondary
position=top-right
width=360
background_opacity=90
lifetime_ms=6000
```

| Setting | Default | Description |
| --- | --- | --- |
| `position` | `bottom-right` | Popup corner: `top-left`, `top-right`, `bottom-left`, or `bottom-right`. |
| `width` | `332` | Popup width in pixels, from `220` to `900`. |
| `lifetime_ms` | `5000` | Default popup lifetime in milliseconds, from `500` to `60000`. |
| `max_notifications` | `5` | Maximum simultaneous mirrored popups per display, from `1` to `20`. |
| `background_opacity` | `100` | Background opacity from `0` (transparent) to `100` (opaque). |
| `left_margin` | `18` | Distance from the left edge in pixels. |
| `right_margin` | `18` | Distance from the right edge in pixels. |
| `top_margin` | `18` | Distance from the top edge in pixels. |
| `bottom_margin` | `58` | Distance from the bottom edge in pixels. |
| `gap` | `12` | Space between stacked popups in pixels, from `0` to `100`. |

The selected corner determines which two margins apply. For example, `top-right` uses `top_margin` and `right_margin`. Margin values start at `0`.

## Service status and logs

View the service status:

```sh
systemctl --user status plasma-notification-mirror.service
```

View recent log messages:

```sh
journalctl --user -u plasma-notification-mirror.service -n 100 --no-pager
```

## After an upgrade

Restart the service to load the updated program:

```sh
systemctl --user restart plasma-notification-mirror.service
```

## Stop mirroring

Stop the service and disable automatic startup:

```sh
systemctl --user disable --now plasma-notification-mirror.service
```
