// -*- mode: js; js-indent-level: 4; indent-tabs-mode: nil -*-
/*
 * Copyright 2010 Red Hat, Inc
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Suite 500, Boston, MA
 * 02110-1335, USA.
 *
 * Author: David Zeuthen <davidz@redhat.com>
 */

const Cinnamon = imports.gi.Cinnamon;
const AccountsService = imports.gi.AccountsService;
const Gio = imports.gi.Gio;
const GObject = imports.gi.GObject;
const GLib = imports.gi.GLib;
const Polkit = imports.gi.Polkit;
const PolkitAgent = imports.gi.PolkitAgent;
const GnomeSession = imports.misc.gnomeSession;
const Meta = imports.gi.Meta;

const Signals = imports.signals;
const Util = imports.misc.util;

const DELAYED_RESET_TIMEOUT = 200;

var AuthenticationDialog = class {
    constructor(actionId, description, cookie, userNames) {
        this.actionId = actionId;
        this._cookie = cookie;
        this.message = description;
        this.userNames = userNames;
        this._wasDismissed = false;
        this._user = null;
        this._completed = false;
        this._doneEmitted = false;

        this._sessionCompletedId = 0;
        this._sessionRequestId = 0;
        this._sessionShowErrorId = 0;
        this._sessionShowInfoId = 0;

        const currentUser = GLib.get_user_name();
        if (userNames && userNames.indexOf(currentUser) !== -1) {
            this._user = currentUser;
        } else if (userNames && userNames.length > 0) {
            this._user = userNames[0];
        } else {
            this._user = currentUser;
        }
    }

    _emitDone(dismissed) {
        if (!this._doneEmitted) {
            this._doneEmitted = true;
            this.emit('done', dismissed);
        }
    }

    performAuthentication() {
        this._destroySession();
        this._session = new PolkitAgent.Session({
            identity: Polkit.UnixUser.new_for_name(this._user),
            cookie: this._cookie
        });
        this._sessionCompletedId = this._session.connect('completed', this._onSessionCompleted.bind(this));
        this._sessionRequestId = this._session.connect('request', this._onSessionRequest.bind(this));
        this._sessionShowErrorId = this._session.connect('show-error', this._onSessionShowError.bind(this));
        this._sessionShowInfoId = this._session.connect('show-info', this._onSessionShowInfo.bind(this));
        this._session.initiate();
    }

    _onSessionCompleted(session, gainedAuthorization) {
        if (this._completed || this._doneEmitted)
            return;

        this._completed = true;

        if (gainedAuthorization) {
            this._emitDone(false);
        } else {
            if (!this._wasDismissed) {
                this._showMessage("error", _("Sorry, that didn't work. Please try again."), () => {
                    if (this._doneEmitted)
                        return;
                    this._wasDismissed = false;
                    this._completed = false;
                    this.performAuthentication();
                });
            } else {
                this._wasDismissed = false;
            }
        }
    }

    _onSessionRequest(session, request, echoOn) {
        this._promptForPassword(session);
    }

    _onSessionShowError(session, text) {
        this._showMessage("error", text, () => {
            if (!this._doneEmitted)
                this._promptForPassword(session);
        });
    }

    _onSessionShowInfo(session, text) {
        this._showMessage("info", text, () => {
            if (!this._doneEmitted)
                this._promptForPassword(session);
        });
    }

    _promptForPassword(session) {
        if (this._doneEmitted)
            return;

        let title = _("Authentication Required");
        let description = this.message ? this.message : _("Please enter your password to continue.");

        let argv = [
            '/usr/bin/zenity-polkit-dialog.py',
            '--title=' + title,
            '--text=' + description
        ];

        Util.spawnCommandLineAsyncIO(null, (stdout, stderr, exitCode) => {
            if (this._doneEmitted)
                return;

            if (exitCode === 0 && stdout) {
                let password = stdout.replace(/\n$/, '');
                if (this._session === session)
                    session.response(password);
            } else {
                this._wasDismissed = true;
                this._emitDone(true);
            }
        }, { argv: argv });
    }

    _showMessage(kind, text, onComplete) {
        let title = _("Authentication Required");
        let type = kind === "info" ? "--info" : "--error";

        let argv = [
            '/usr/bin/zenity-polkit-dialog.py',
            '--title=' + title,
            '--text=' + text,
            type
        ];

        Util.spawnCommandLineAsyncIO(null, (stdout, stderr, exitCode) => {
            if (typeof onComplete === 'function')
                onComplete();
        }, { argv: argv });
    }

    _destroySession() {
        if (this._session) {
            if (!this._completed)
                this._session.cancel();
            this._completed = false;

            if (this._sessionCompletedId > 0) {
                this._session.disconnect(this._sessionCompletedId);
                this._session.disconnect(this._sessionRequestId);
                this._session.disconnect(this._sessionShowErrorId);
                this._session.disconnect(this._sessionShowInfoId);

                this._sessionCompletedId = 0;
                this._sessionRequestId = 0;
                this._sessionShowErrorId = 0;
                this._sessionShowInfoId = 0;
            }

            this._session = null;
        }
    }

    cancel() {
        this._wasDismissed = true;
        this._emitDone(true);
    }

    destroy() {
        this._destroySession();
    }

    close() {
        this._destroySession();
    }
};

Signals.addSignalMethods(AuthenticationDialog.prototype);

var AuthenticationAgent = class {
    constructor() {
        this._native = new Cinnamon.PolkitAuthenticationAgent();
        this._native.connect('initiate', this._onInitiate.bind(this));
        this._native.connect('cancel', this._onCancel.bind(this));
        try {
            const session = new GnomeSession.SessionManager();
            const csSessionId = session.SessionId;

            let procSessionId = this._native.register();
            if (procSessionId !== csSessionId) {
                global.logWarning("Unable to register as the polkit agent for login session '%s'. Cinnamon is running under '%s'"
                                  .format(csSessionId, procSessionId));
                this._native.unregister();
                this._native = null;

                if (Meta.is_wayland_compositor()) {
                    global.logWarning("Please log out and back in to correct this.")
                    return;
                }

                if (!GLib.getenv("CINNAMON_ALLOW_SSH")) {
                    global.logWarning('Restarting Cinnamon in 5 seconds.');
                    GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 5, () => session.RestartCinnamonLauncherRemote())
                    return;
                }
            } else {
                global.log("Cinnamon registered as the Polkit agent for the active session (%s)".format(procSessionId));
            }
        } catch(e) {
            global.logWarning('Failed to register Polkit Agent', e);
        }
        this._currentDialog = null;
    }

    _onInitiate(nativeAgent, actionId, message, iconName, cookie, userNames) {
        this._currentDialog = new AuthenticationDialog(actionId, message, cookie, userNames);
        this._currentDialog.connect('done', this._onDialogDone.bind(this));
        this._currentDialog.performAuthentication();
    }

    _onCancel(nativeAgent) {
        this._completeRequest(true);
    }

    _onDialogDone(dialog, dismissed) {
        this._completeRequest(dismissed);
    }

    _completeRequest(dismissed) {
        if (this._currentDialog) {
            this._currentDialog.destroy();
            this._currentDialog = null;
        }

        this._native.complete(dismissed);
    }
};

function init() {
    let agent = new AuthenticationAgent();
}
