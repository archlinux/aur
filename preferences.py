# -*- coding: utf-8 -*-
# ANoise 0.0.29 (Ambient Noise)
# Copyright (C) 2015 Marcos Alvarez Costales https://launchpad.net/~costales
#
# ANoise is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# ANoise is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with ANoise; if not, see http://www.gnu.org/licenses
# for more information.

import gi, os, shutil, webbrowser, subprocess
from datetime import datetime, timedelta
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, WebKit2
web_content = WebKit2.WebView()
# i18n
import gettext
gettext.textdomain('anoise')
_ = gettext.gettext


class Preferences:
    """This will be for DE as MATE 14.10+ which hasn't sound indicator with Gtk3"""
    def __init__(self, player):
        self.AUTOSTART = os.path.join(os.getenv('HOME'), '.config', 'autostart', 'anoise.desktop')
        self.DESKTOP = '/usr/share/applications/anoise.desktop'
        
        self.player = player
        builder = Gtk.Builder()
        
        builder.add_from_file('/usr/share/anoise/preferences.ui')
        self.win_preferences = builder.get_object('preferences_win')
        self.adjustment   = builder.get_object('adjustment_timer')
        self.sp_timer     = builder.get_object('spin_timer')
        self.lbl_minutes  = builder.get_object('lbl_minutes')
        self.cb_sleep     = builder.get_object('cb_timesleep')
        self.cb_autostart = builder.get_object('cb_autostart')
        self.btn_noises   = builder.get_object('btn_show_noises')
        self.web          = builder.get_object('boxWeb')
        
        # Autostart
        if os.path.isfile(self.AUTOSTART):
            self.cb_autostart.set_active(True)
        else:
            self.cb_autostart.set_active(False)
        
        builder.connect_signals(self)
        
        self.win_width = self.win_height = 0
        self._save_window_size()
    
    def show(self):
        self.win_preferences.show()
    
    def _restore_window_size(self):
        self._save_window_size() # Always get the bigger widht
        self.win_preferences.set_size_request(self.win_width, self.win_height)
            
    def _save_window_size(self):
        width, height = self.win_preferences.get_size()
        if width > self.win_width:
            self.win_width = width
        if height > self.win_height:
            self.win_height = height
    
    def on_cb_autostart_toggled(self, widget, data=None):
        if self.cb_autostart.get_active():
            try:
                shutil.copy2(self.DESKTOP, self.AUTOSTART)
            except:
                pass
        else:
            try:
                os.remove(self.AUTOSTART)
            except:
                pass
    
    def set_show_timer(self):
        if self.cb_sleep.get_active():
            self.cb_sleep.set_active(False)
    
    def on_cb_timesleep_toggled(self, widget, data=None):
        seconds = self.sp_timer.get_value_as_int() * 60
        self.sp_timer.set_sensitive(not self.cb_sleep.get_active())
        self.player.set_timer(self.cb_sleep.get_active(), seconds)
        if self.cb_sleep.get_active():
            self.lbl_minutes.hide()
            self.sp_timer.hide()
            x = datetime.now() + timedelta(seconds=seconds)
            msg = ' '.join([_("ANoise will stop at"), x.strftime('%H:%M')])
            self.cb_sleep.set_label(msg)
            self._restore_window_size()
        else:
            self.lbl_minutes.show()
            self.sp_timer.show()
            self.cb_sleep.set_label(_("Stop in"))
            self._restore_window_size()
    
    def on_btn_show_noises_clicked(self, widget, data=None):
        self.btn_noises.hide()
        web_content = WebKit.WebView()
        settings = web_content.get_settings()
        settings.set_property('enable-default-context-menu', False)
        web_content.set_settings(settings)
        web_content.open('http://anoise.tuxfamily.org/noises')
        web_content.connect('navigation-requested', self._on_navigation_requested)
        self.web.add(web_content)
        self.web.show_all()
    
    def _on_navigation_requested(self, view, frame, req):
        uri = req.get_uri()
        if uri and uri.startswith('apt'): # OS installer
            subprocess.Popen(["apturl", uri], shell=False)
        if uri and uri.startswith('http'): # authors
            webbrowser.open(uri)
        return True
    
    def on_preferences_delete_event(self, widget, data=None):
        self.win_preferences.hide()
        return True
