const Cinnamon = imports.gi.Cinnamon;
const Clutter = imports.gi.Clutter;
const St = imports.gi.St;
const Pango = imports.gi.Pango;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const GObject = imports.gi.GObject;
const Gcr = imports.gi.Gcr;

const Util = imports.misc.util;

var KeyringDialog = GObject.registerClass(
class KeyringDialog extends GObject.Object {
    _init() {
        super._init();

        this.prompt = new Cinnamon.KeyringPrompt();
        this.prompt.connect('show-password', this._onShowPassword.bind(this));
        this.prompt.connect('show-confirm', this._onShowConfirm.bind(this));
        this.prompt.connect('prompt-close', this._onHidePrompt.bind(this));

        this._dummyPasswordEntry = new Clutter.Text();
        this._dummyConfirmEntry = new Clutter.Text();
        this.prompt.set_password_actor(this._dummyPasswordEntry);
        this.prompt.set_confirm_actor(this._dummyConfirmEntry);

        this._zenityRunning = false;
    }

    _onShowPassword() {
        if (this._zenityRunning)
            return;

        this._zenityRunning = true;
        let message = this.prompt.message || "Enter password:";
        let cmd = '/usr/bin/zenity-keyring-dialog.py unlock ' +
            GLib.shell_quote(message);

        Util.spawnCommandLineAsyncIO(cmd,
            (stdout, stderr, exitCode) => {
                this._zenityRunning = false;
                if (exitCode === 0 && stdout && stdout.trim().length > 0) {
                    this._dummyPasswordEntry.text = stdout.trim();
                    this.prompt.complete();
                } else {
                    this.prompt.cancel();
                }
            });
    }

    _onShowConfirm() {
        if (this._zenityRunning)
            return;

        this._zenityRunning = true;
        let message = this.prompt.message || "Create a new keyring password:";
        let cmd = '/usr/bin/zenity-keyring-dialog.py create ' +
            GLib.shell_quote(message);

        Util.spawnCommandLineAsyncIO(cmd,
            (stdout, stderr, exitCode) => {
                this._zenityRunning = false;
                if (exitCode === 0 && stdout && stdout.trim().length > 0) {
                    this._dummyPasswordEntry.text = stdout.trim();
                    this._dummyConfirmEntry.text = stdout.trim();
                    this.prompt.complete();
                } else {
                    this.prompt.cancel();
                }
            });
    }

    _onHidePrompt() {
        this._zenityRunning = false;
    }
});

function init() {
    prompter = new Gcr.SystemPrompter();
    prompter.connect('new-prompt', () => {
        let dialog = new KeyringDialog();
        return dialog.prompt;
    });

    let connection = Gio.DBus.session;
    prompter.register(connection);
    Gio.bus_own_name_on_connection (connection, 'org.gnome.keyring.SystemPrompter',
                                    Gio.BusNameOwnerFlags.ALLOW_REPLACEMENT, null, null);
}
