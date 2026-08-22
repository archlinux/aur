const Cinnamon = imports.gi.Cinnamon;
const Clutter = imports.gi.Clutter;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const GObject = imports.gi.GObject;
const Meta = imports.gi.Meta;
const St = imports.gi.St;

const Main = imports.ui.main;

const Util = imports.misc.util;

const AudioDeviceSelectionIface = `
<node>
<interface name="org.Cinnamon.AudioDeviceSelection">
<method name="Open">
    <arg name="devices" direction="in" type="as" />
</method>
<method name="Close">
</method>
<signal name="DeviceSelected">
    <arg name="device" type="s" />
</signal>
</interface>
</node>`;

const AudioDevice = {
    HEADPHONES: 1 << 0,
    HEADSET:    1 << 1,
    MICROPHONE: 1 << 2,
};

var AudioDeviceSelectionDBus = class AudioDeviceSelectionDBus {
    constructor() {
        this._activeSender = null;

        this._dbusImpl = Gio.DBusExportedObject.wrapJSObject(AudioDeviceSelectionIface, this);
        this._dbusImpl.export(Gio.DBus.session, '/org/Cinnamon/AudioDeviceSelection');

        Gio.DBus.session.own_name('org.Cinnamon.AudioDeviceSelection', Gio.BusNameOwnerFlags.REPLACE, null, null);
    }

    OpenAsync(params, invocation) {
        if (this._activeSender) {
            invocation.return_value(null);
            return;
        }

        let [deviceNames] = params;
        let devices = 0;
        deviceNames.forEach(n => (devices |= AudioDevice[n.toUpperCase()]));

        let available = [];
        if (devices & AudioDevice.HEADPHONES) available.push('HEADPHONES');
        if (devices & AudioDevice.HEADSET) available.push('HEADSET');
        if (devices & AudioDevice.MICROPHONE) available.push('MICROPHONE');

        if (available.length < 2) {
            invocation.return_value(null);
            return;
        }

        this._activeSender = invocation.get_sender();
        invocation.return_value(null);

        let deviceArg = available.join(',');
        let cmd = '/usr/bin/zenity-audio-device-dialog.py "' + deviceArg + '"';

        Util.spawnCommandLineAsyncIO(cmd,
            (stdout, stderr, exitCode) => {
                if (exitCode === 0 && stdout && stdout.trim()) {
                    let deviceName = stdout.trim().toLowerCase();
                    let connection = this._dbusImpl.get_connection();
                    let info = this._dbusImpl.get_info();
                    connection.emit_signal(
                        this._activeSender,
                        this._dbusImpl.get_object_path(),
                        info ? info.name : null,
                        'DeviceSelected',
                        GLib.Variant.new('(s)', [deviceName]));
                }
                this._activeSender = null;
            });
    }

    CloseAsync(params, invocation) {
        this._activeSender = null;
        invocation.return_value(null);
    }
}
