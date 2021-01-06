# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-newyear-theme
pkgver=1.0
pkgrel=11
pkgdesc="Christmas theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-newyear-theme/"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz"
        "patch.diff")
sha256sums=('dbb885f926ad1e2e3b282484928da7553c124ee1f494bd8e580efd670157dc99'
            '59891d8d987344b5dc3113680c0203ed7c02b17bdc6cb41a8dba0d1a7e50812c')


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}"/patch.diff
    ln -s document-viewer.svg neru-newyear-light/medium/apps/graphics-viewer-document.svg
    ln -s document-viewer.svg neru-newyear-light/medium/apps/org.gnome.Evince.svg
    ln -s document-viewer.svg neru-newyear-light/medium/apps/xpdf9.svg
    ln -s document-viewer.svg neru-newyear-light/medium/apps/accessories-document-viewer.svg

    ln -s qv4l2.svg neru-newyear-light/medium/apps/qvidcap.svg
    ln -s usb-creator.svg neru-newyear-light/medium/apps/mintstick.svg
    ln -s utilities-terminal.svg neru-newyear-light/medium/apps/org.gnome.Terminal.svg
    ln -s preferences-desktop-color.svg neru-newyear-light/medium/apps/xfce4-color-settings.svg
    ln -s preferences-desktop-color.svg neru-newyear-light/medium/apps/package_graphics.svg
    ln -s wps-office-wpsmain.svg neru-newyear-light/medium/apps/wps-office2019-wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-light/medium/apps/wps-office2019-wppmain.svg
    ln -s wps-office-wpsmain.svg neru-newyear-light/medium/apps/com.wps.Office2019.wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-light/medium/apps/com.wps.Office2019.wppmain.svg
    ln -s wps-office-wpsmain.svg neru-newyear-light/medium/apps/com.wps.Office.wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-light/medium/apps/com.wps.Office.wppmain.svg
    ln -s wps-office-etmain.svg neru-newyear-light/medium/apps/wps-office2019-etmain.svg
    ln -s electron.svg neru-newyear-light/medium/apps/electron4.svg
    ln -s supertux.svg neru-newyear-light/medium/apps/supertux2.svg

    ln -s document-viewer.svg neru-newyear-dark/medium/apps/graphics-viewer-document.svg
    ln -s document-viewer.svg neru-newyear-dark/medium/apps/org.gnome.Evince.svg
    ln -s document-viewer.svg neru-newyear-dark/medium/apps/xpdf9.svg
    ln -s document-viewer.svg neru-newyear-dark/medium/apps/accessories-document-viewer.svg

    ln -s qv4l2.svg neru-newyear-dark/medium/apps/qvidcap.svg
    ln -s usb-creator.svg neru-newyear-dark/medium/apps/mintstick.svg
    ln -s utilities-terminal.svg neru-newyear-dark/medium/apps/org.gnome.Terminal.svg
    ln -s preferences-desktop-color.svg neru-newyear-dark/medium/apps/xfce4-color-settings.svg
    ln -s preferences-desktop-color.svg neru-newyear-dark/medium/apps/package_graphics.svg
    ln -s wps-office-wpsmain.svg neru-newyear-dark/medium/apps/wps-office2019-wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-dark/medium/apps/wps-office2019-wppmain.svg
    ln -s wps-office-wpsmain.svg neru-newyear-dark/medium/apps/com.wps.Office2019.wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-dark/medium/apps/com.wps.Office2019.wppmain.svg
    ln -s wps-office-wpsmain.svg neru-newyear-dark/medium/apps/com.wps.Office.wpsmain.svg
    ln -s wps-office-wppmain.svg neru-newyear-dark/medium/apps/com.wps.Office.wppmain.svg
    ln -s wps-office-etmain.svg neru-newyear-dark/medium/apps/wps-office2019-etmain.svg
    ln -s electron.svg neru-newyear-dark/medium/apps/electron4.svg
    ln -s supertux.svg neru-newyear-dark/medium/apps/supertux2.svg

    ln -s filelight.svg neru-newyear-light/medium/apps/org.gnome.DiskUtility.svg
    ln -s ark.svg neru-newyear-light/medium/apps/org.gnome.ArchiveManager.svg
    ln -s preferences-system-privacy.svg neru-newyear-light/medium/apps/org.gnome.seahorse.Application.svg
    ln -s applications-fonts.svg neru-newyear-light/medium/apps/org.gnome.font-viewer.svg
    ln -s edit-find.svg neru-newyear-light/medium/apps/gtk-find.svg
    ln -s applications-multimedia.svg neru-newyear-light/medium/apps/gmtpicon.svg
    ln -s fontforge.svg neru-newyear-light/medium/apps/org.fontforge.FontForge.svg

    ln -s filelight.svg neru-newyear-dark/medium/apps/org.gnome.DiskUtility.svg
    ln -s ark.svg neru-newyear-dark/medium/apps/org.gnome.ArchiveManager.svg
    ln -s preferences-system-privacy.svg neru-newyear-dark/medium/apps/org.gnome.seahorse.Application.svg
    ln -s applications-fonts.svg neru-newyear-dark/medium/apps/org.gnome.font-viewer.svg
    ln -s edit-find.svg neru-newyear-dark/medium/apps/gtk-find.svg
    ln -s applications-multimedia.svg neru-newyear-dark/medium/apps/gmtpicon.svg
    ln -s fontforge.svg neru-newyear-dark/medium/apps/org.fontforge.FontForge.svg

    ln -s system-file-manager.svg neru-newyear-light/medium/apps/Insight-FileManager.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/WorkerIcon48.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/file-manager.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/filerunner.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/kfm.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/nautilus-actions-config-tool.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/redhat-filemanager.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/user-file-manager.svg

    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/Insight-FileManager.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/WorkerIcon48.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/file-manager.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/filerunner.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/kfm.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/nautilus-actions-config-tool.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/redhat-filemanager.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/user-file-manager.svg
    
    ln -s wps-office-pdfmain.svg neru-newyear-light/medium/apps/wps-office2019-pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-light/medium/apps/com.wps.Office2019.pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-light/medium/apps/com.wps.Office.pdfmain.svg
    ln -s distributor-logo-archlinux.svg neru-newyear-light/medium/apps/kalu.svg
    ln -s preferences-system-notifications.svg neru-newyear-light/medium/apps/org.xfce.notification.svg
    ln -s accessories-dictionary.svg neru-newyear-light/medium/apps/org.xfce.Dictionary.svg
    ln -s flameshot.svg neru-newyear-light/medium/apps/org.flameshot.Flameshot.svg
    
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/wps-office2019-pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/com.wps.Office2019.pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/com.wps.Office.pdfmain.svg
    ln -s distributor-logo-archlinux.svg neru-newyear-dark/medium/apps/kalu.svg
    ln -s preferences-system-notifications.svg neru-newyear-dark/medium/apps/org.xfce.notification.svg
    ln -s accessories-dictionary.svg neru-newyear-dark/medium/apps/org.xfce.Dictionary.svg
    ln -s flameshot.svg neru-newyear-dark/medium/apps/org.flameshot.Flameshot.svg

    ln -s kmenuedit.svg neru-newyear-light/medium/apps/org.xfce.garcon.svg
    ln -s cutecom.svg neru-newyear-light/medium/apps/org.xfce.volman.svg
    ln -s preferences-system-search.svg neru-newyear-light/medium/apps/org.xfce.appfinder.svg
    ln -s internet-mail.svg neru-newyear-light/medium/apps/org.xfce.mailreader.svg
    ln -s cs-panel.svg neru-newyear-light/medium/apps/org.xfce.panel.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/org.xfce.thunar.svg
    ln -s preferences-desktop-color.svg neru-newyear-light/medium/apps/org.xfce.settings.color.svg
    ln -s system-file-manager.svg neru-newyear-light/medium/apps/org.xfce.filemanager.svg
    ln -s preferences-system-power.svg neru-newyear-light/medium/apps/org.xfce.powermanager.svg
    ln -s preferences-desktop-display.svg neru-newyear-light/medium/apps/org.xfce.settings.display.svg
    ln -s utilities-tweak-tool.svg neru-newyear-light/medium/apps/org.xfce.settings.manager.svg
    ln -s gnome-tweak-tool.svg neru-newyear-light/medium/apps/org.xfce.xfwm4-tweaks.svg
    ln -s workspace-switcher-left-bottom.svg neru-newyear-light/medium/apps/org.xfce.workspaces.svg
    ln -s applets-screenshooter.svg neru-newyear-light/medium/apps/org.xfce.screenshooter.svg
    ln -s utilities-terminal.svg neru-newyear-light/medium/apps/org.xfce.terminal.svg
    ln -s utilities-terminal.svg neru-newyear-light/medium/apps/org.xfce.terminalemulator.svg
    ln -s utilities-terminal.svg neru-newyear-light/medium/apps/org.xfce.terminal-settings.svg
    ln -s Xfwm4CompositeEditor.svg neru-newyear-light/medium/apps/org.xfce.settings.editor.svg
    ln -s internet-web-browser.svg neru-newyear-light/medium/apps/org.xfce.webbrowser.svg
    ln -s cs-desktop.svg neru-newyear-light/medium/apps/org.xfce.xfdesktop.svg
    ln -s gdm-xnest.svg neru-newyear-light/medium/apps/org.xfce.xfwm4.svg
    ln -s ktouch.svg neru-newyear-light/medium/apps/org.xfce.settings.keyboard.svg
    ln -s preferences-desktop-peripherals.svg neru-newyear-light/medium/apps/org.xfce.settings.mouse.svg
    ln -s system-shutdown.svg neru-newyear-light/medium/apps/org.xfce.session.svg
    ln -s preferences-desktop-theme.svg neru-newyear-light/medium/apps/org.xfce.settings.appearance.svg
    ln -s preferences-desktop-default-applications.svg neru-newyear-light/medium/apps/org.xfce.settings.default-applications.svg
    ln -s preferences-desktop-accessibility.svg neru-newyear-light/medium/apps/org.xfce.settings.accessibility.svg
    ln -s accessories-text-editor.svg neru-newyear-light/medium/apps/org.xfce.mousepad.svg
    
    ln -s kmenuedit.svg neru-newyear-dark/medium/apps/org.xfce.garcon.svg
    ln -s cutecom.svg neru-newyear-dark/medium/apps/org.xfce.volman.svg
    ln -s preferences-system-search.svg neru-newyear-dark/medium/apps/org.xfce.appfinder.svg
    ln -s internet-mail.svg neru-newyear-dark/medium/apps/org.xfce.mailreader.svg
    ln -s cs-panel.svg neru-newyear-dark/medium/apps/org.xfce.panel.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/org.xfce.thunar.svg
    ln -s preferences-desktop-color.svg neru-newyear-dark/medium/apps/org.xfce.settings.color.svg
    ln -s system-file-manager.svg neru-newyear-dark/medium/apps/org.xfce.filemanager.svg
    ln -s preferences-system-power.svg neru-newyear-dark/medium/apps/org.xfce.powermanager.svg
    ln -s preferences-desktop-display.svg neru-newyear-dark/medium/apps/org.xfce.settings.display.svg
    ln -s utilities-tweak-tool.svg neru-newyear-dark/medium/apps/org.xfce.settings.manager.svg
    ln -s gnome-tweak-tool.svg neru-newyear-dark/medium/apps/org.xfce.xfwm4-tweaks.svg
    ln -s workspace-switcher-left-bottom.svg neru-newyear-dark/medium/apps/org.xfce.workspaces.svg
    ln -s applets-screenshooter.svg neru-newyear-dark/medium/apps/org.xfce.screenshooter.svg
    ln -s utilities-terminal.svg neru-newyear-dark/medium/apps/org.xfce.terminal.svg
    ln -s utilities-terminal.svg neru-newyear-dark/medium/apps/org.xfce.terminalemulator.svg
    ln -s utilities-terminal.svg neru-newyear-dark/medium/apps/org.xfce.terminal-settings.svg
    ln -s Xfwm4CompositeEditor.svg neru-newyear-dark/medium/apps/org.xfce.settings.editor.svg
    ln -s internet-web-browser.svg neru-newyear-dark/medium/apps/org.xfce.webbrowser.svg
    ln -s cs-desktop.svg neru-newyear-dark/medium/apps/org.xfce.xfdesktop.svg
    ln -s gdm-xnest.svg neru-newyear-dark/medium/apps/org.xfce.xfwm4.svg
    ln -s ktouch.svg neru-newyear-dark/medium/apps/org.xfce.settings.keyboard.svg
    ln -s preferences-desktop-peripherals.svg neru-newyear-dark/medium/apps/org.xfce.settings.mouse.svg
    ln -s system-shutdown.svg neru-newyear-dark/medium/apps/org.xfce.session.svg
    ln -s preferences-desktop-theme.svg neru-newyear-dark/medium/apps/org.xfce.settings.appearance.svg
    ln -s preferences-desktop-default-applications.svg neru-newyear-dark/medium/apps/org.xfce.settings.default-applications.svg
    ln -s preferences-desktop-accessibility.svg neru-newyear-dark/medium/apps/org.xfce.settings.accessibility.svg
    ln -s accessories-text-editor.svg neru-newyear-dark/medium/apps/org.xfce.mousepad.svg
    
    ln -s system-switch-user.svg neru-newyear-light/medium/apps/xfsm-switch-user.svg
    ln -s system-lock-screen.svg neru-newyear-light/medium/apps/xfsm-lock.svg
    
    ln -s system-switch-user.svg neru-newyear-dark/medium/apps/xfsm-switch-user.svg
    ln -s system-lock-screen.svg neru-newyear-dark/medium/apps/xfsm-lock.svg
    
    ln -s applications-utilities.svg neru-newyear-light/medium/apps/org.xfce.taskmanager.svg
    ln -s builder.svg neru-newyear-light/medium/apps/applications-engineering.svg
    ln -s xfce4-systray.svg neru-newyear-light/medium/apps/org.xfce.panel.statustray.svg
    ln -s preferences-desktop-launch-feedback.svg neru-newyear-light/medium/apps/org.xfce.panel.launcher.svg
    ln -s ../devices/battery.svg neru-newyear-light/medium/apps/xfce4-battery-plugin.svg
    ln -s ../places/folder.svg neru-newyear-light/medium/apps/org.xfce.panel.directorymenu.svg
    ln -s workspace-switcher-left-bottom.svg neru-newyear-light/medium/apps/org.xfce.panel.pager.svg
    ln -s cs-desktop.svg neru-newyear-light/medium/apps/org.xfce.panel.showdesktop.svg
    ln -s preferences-system-time.svg neru-newyear-light/medium/apps/org.xfce.panel.clock.svg
    ln -s menulibre.svg neru-newyear-light/medium/apps/org.xfce.panel.windowmenu.svg
    ln -s xfce4-taskbar.svg neru-newyear-light/medium/apps/org.xfce.panel.tasklist.svg
    
    ln -s applications-utilities.svg neru-newyear-dark/medium/apps/org.xfce.taskmanager.svg
    ln -s builder.svg neru-newyear-dark/medium/apps/applications-engineering.svg
    ln -s xfce4-systray.svg neru-newyear-dark/medium/apps/org.xfce.panel.statustray.svg
    ln -s preferences-desktop-launch-feedback.svg neru-newyear-dark/medium/apps/org.xfce.panel.launcher.svg
    ln -s ../devices/battery.svg neru-newyear-dark/medium/apps/xfce4-battery-plugin.svg
    ln -s ../places/folder.svg neru-newyear-dark/medium/apps/org.xfce.panel.directorymenu.svg
    ln -s workspace-switcher-left-bottom.svg neru-newyear-dark/medium/apps/org.xfce.panel.pager.svg
    ln -s cs-desktop.svg neru-newyear-dark/medium/apps/org.xfce.panel.showdesktop.svg
    ln -s preferences-system-time.svg neru-newyear-dark/medium/apps/org.xfce.panel.clock.svg
    ln -s menulibre.svg neru-newyear-dark/medium/apps/org.xfce.panel.windowmenu.svg
    ln -s xfce4-taskbar.svg neru-newyear-dark/medium/apps/org.xfce.panel.tasklist.svg
    ln -s system-help.svg neru-newyear-light/medium/apps/org.xfce.about.svg
    ln -s system-help.svg neru-newyear-dark/medium/apps/org.xfce.about.svg
    ln -s mate-panel-separator.svg neru-newyear-light/medium/apps/org.xfce.panel.separator.svg
    ln -s mate-panel-separator.svg neru-newyear-dark/medium/apps/org.xfce.panel.separator.svg
    ln -s onlyiffice.svg neru-newyear-light/medium/apps/onlyoffice-desktopeditors.svg
    ln -s onlyiffice.svg neru-newyear-dark/medium/apps/onlyoffice-desktopeditors.svg
    ln -s desktop-environment-xfce.svg neru-newyear-light/medium/apps/org.xfce.panel.applicationsmenu.svg

    ln -s window-close.svg neru-newyear-light/small/actions/xfce-wm-close.svg
    ln -s window-minimize.svg neru-newyear-light/small/actions/xfce-wm-minimize.svg
    ln -s xfce-wm-maximize.svg neru-newyear-light/small/actions/xfce-wm-unmaximize.svg

    ln -s window-close.svg neru-newyear-dark/small/actions/xfce-wm-close.svg
    ln -s window-minimize.svg neru-newyear-dark/small/actions/xfce-wm-minimize.svg
    ln -s xfce-wm-maximize.svg neru-newyear-dark/small/actions/xfce-wm-unmaximize.svg

    ln -s ../../../neru-newyear-light/medium/apps/distributor-logo-archlinux.svg \
    neru-newyear-dark/medium/apps/distributor-logo-archlinux.svg
    ln -s ../../../neru-newyear-light/medium/apps/wps-office-pdfmain.svg \
    neru-newyear-dark/medium/apps/wps-office-pdfmain.svg
    ln -s ../../../neru-newyear-light/medium/apps/wpa_gui.svg \
    neru-newyear-dark/medium/apps/wpa_gui.svg
    ln -s ../../../neru-newyear-light/medium/apps/sandbox.svg \
    neru-newyear-dark/medium/apps/sandbox.svg
    ln -s ../../../neru-newyear-light/medium/apps/flameshot.svg \
    neru-newyear-dark/medium/apps/flameshot.svg
    ln -s ../../../neru-newyear-light/medium/apps/mate-panel-separator.svg \
    neru-newyear-dark/medium/apps/mate-panel-separator.svg
    ln -s ../../../neru-newyear-light/medium/apps/org.xfce.tumbler.svg \
    neru-newyear-dark/medium/apps/org.xfce.tumbler.svg
    ln -s ../../../neru-newyear-light/medium/apps/bitwarden.svg \
    neru-newyear-dark/medium/apps/bitwarden.svg
    ln -s ../../../neru-newyear-light/medium/apps/doom3.svg \
    neru-newyear-dark/medium/apps/doom3.svg
    ln -s ../../../neru-newyear-light/medium/apps/qcalcfilehash.svg \
    neru-newyear-dark/medium/apps/qcalcfilehash.svg
    ln -s ../../../neru-newyear-light/medium/apps/quake.svg \
    neru-newyear-dark/medium/apps/quake.svg
    ln -s ../../../neru-newyear-light/medium/apps/rocksndiamonds.svg \
    neru-newyear-dark/medium/apps/rocksndiamonds.svg
    ln -s ../../../neru-newyear-light/medium/apps/uno-calculator.svg \
    neru-newyear-dark/medium/apps/uno-calculator.svg
    ln -s ../../../neru-newyear-light/medium/apps/weather.svg \
    neru-newyear-dark/medium/apps/weather.svg
    ln -s ../../../neru-newyear-light/medium/apps/desktop-environment-xfce.svg \
    neru-newyear-dark/medium/apps/desktop-environment-xfce.svg
    ln -s ../../../neru-newyear-light/medium/apps/desktop-environment-xfce.svg \
    neru-newyear-dark/medium/apps/org.xfce.panel.applicationsmenu.svg
    ln -s ../../../neru-newyear-light/medium/apps/darkplaces.svg \
    neru-newyear-dark/medium/apps/darkplaces.svg
    echo -e "\033[1;35mf\033[1;35mi\033[1;35mx \033[1;34mL\033[1;34mI\033[1;34mN\033[1;34mK\033[0m"
}


package() {
  cd "${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/share/icons"
    cp -r {'neru-newyear-dark','neru-newyear-light'} "${pkgdir}/usr/share/icons"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md AUTHORS screenshot.svg -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

