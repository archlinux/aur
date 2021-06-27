# Toggle Bluetooth on/off

[Bash script](toggle-bluetooth.sh) to toggle bluetooth mode between `on` and `off`.

The script does first run `bluetoothctl -- show` and searches the output for `Powered: yes` or `Powered: no`.

Subsequently the bluetooth status is changed from `on` to `off` or the other way around by executing
`bluetoothctl -- power off` respectively `bluetoothctl -- power on`.

## XFCE4

In XFCE4 one can add a launcher to the task bar to
execute the script with just one click.

See the `add-xfce4-launcher` target of the [Makefile](Makefile) for an
automated way to do this.

For reference, here is a screenshot of the launcher (top right on taskbar) with a desktop notification
after the launcher has been clicked.

![](screenshot_launcher-with-icon_notification.png)
