# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-newyear-theme
pkgver=1.0
pkgrel=7
pkgdesc="Christmas theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-newyear-theme/"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz"
        "patch.diff")
sha256sums=('dbb885f926ad1e2e3b282484928da7553c124ee1f494bd8e580efd670157dc99'
            '3bad50c678c60460421b07803812b8dd7b3492f21738c65970767c4d1f1a0b05')


prepare() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
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
    
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/wps-office2019-pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/com.wps.Office2019.pdfmain.svg
    ln -s wps-office-pdfmain.svg neru-newyear-dark/medium/apps/com.wps.Office.pdfmain.svg
    ln -s distributor-logo-archlinux.svg neru-newyear-dark/medium/apps/kalu.svg
    
    rm -f neru-newyear-dark/medium/apps/com.librehat.yahooweather.svg
    rm -f neru-newyear-dark/medium/apps/cumulus.svg
    rm -f neru-newyear-dark/medium/apps/gis-weather.svg
    rm -f neru-newyear-dark/medium/apps/gnome-weather.svg
    rm -f neru-newyear-dark/medium/apps/indicator-weather.svg
    rm -f neru-newyear-dark/medium/apps/org.gnome.Weather.Application.svg
    rm -f neru-newyear-dark/medium/apps/org.gnome.weather.application.svg
    rm -f neru-newyear-dark/medium/apps/org.gnome.Weather.svg
    rm -f neru-newyear-dark/medium/apps/org.gnome.weather.svg
    rm -f neru-newyear-dark/medium/apps/xfce4-weather.svg
    
    rm -f neru-newyear-light/medium/apps/com.librehat.yahooweather.svg
    rm -f neru-newyear-light/medium/apps/cumulus.svg
    rm -f neru-newyear-light/medium/apps/gis-weather.svg
    rm -f neru-newyear-light/medium/apps/gnome-weather.svg
    rm -f neru-newyear-light/medium/apps/indicator-weather.svg
    rm -f neru-newyear-light/medium/apps/org.gnome.Weather.Application.svg
    rm -f neru-newyear-light/medium/apps/org.gnome.weather.application.svg
    rm -f neru-newyear-light/medium/apps/org.gnome.Weather.svg
    rm -f neru-newyear-light/medium/apps/org.gnome.weather.svg
    rm -f neru-newyear-light/medium/apps/xfce4-weather.svg
}


package() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/share/icons"
    cp -r {'neru-newyear-dark','neru-newyear-light'} "${pkgdir}/usr/share/icons"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md AUTHORS screenshot.svg -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

