# Maintainer: Francis C.
pkgname=rstudio-fcitx5
pkgver=2021.09.1.372
pkgrel=3
pkgdesc='Rstudio plugin for using Fcitx5'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-qt'
license=('LGPL')
depends=('rstudio-desktop-bin' 'fcitx5-qt')
source=("https://github.com/francistw/rstudio-fcitx5/raw/main/libfcitx5platforminputcontextplugin.so"
        "https://github.com/francistw/rstudio-fcitx5/raw/main/libFcitx5Qt5DBusAddons.so.1")
sha256sums=('925b976d0bb3462f93cd3e75eb75037784bc676c1201d9a2f974a081b99c8e8b'
            '70b302ef8cc0104735e00a0c1a0ba5f3d823571d42a20560e934cc4cb166ad41')

package() {
	install -D "${srcdir}/libfcitx5platforminputcontextplugin.so" "${pkgdir}/usr/lib/rstudio/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"
	install -D "${srcdir}/libFcitx5Qt5DBusAddons.so.1" "${pkgdir}/usr/lib/rstudio/plugins/dbusaddons/libFcitx5Qt5DBusAddons.so.1"
}
