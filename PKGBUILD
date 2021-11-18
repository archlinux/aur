# Maintainer: Francis C.
pkgname=rstudio-fcitx5
pkgver=2021.09.1.372
pkgrel=1
pkgdesc='Rstudio plugin for using Fcitx5'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-qt'
license=('LGPL')
depends=('rstudio-desktop-bin' 'fcitx5-qt')
source=("https://github.com/francistw/rstudio-fcitx5/raw/main/libfcitx5platforminputcontextplugin.so")
sha256sums=(58d37089d31da210079b5269afeb7306a854bdb3e6c292f24239024afbe68829)

package() {
	install -D "${srcdir}/libfcitx5platforminputcontextplugin.so" "${pkgdir}/usr/lib/rstudio/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"
}
