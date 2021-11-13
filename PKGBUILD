# Maintainer: Francis C.
pkgname=fcitx5-rstudio
pkgver=2021.09.0.351
pkgrel=1
pkgdesc='Rstudio plugin for using Fcitx5'
arch=('x86_64')
url='http://www.rstudio.org/'
license=('LGPL')
depends=('rstudio-desktop-bin')
source=("https://github.com/francistw/fcitx5-rstudio/raw/main/libfcitx5platforminputcontextplugin.so")
sha256sums=(8073ba7e2ab48749d26fed4540b9e98b682f92daf9d49bb0c30d3857bffb72d3)

package() {
	install -D "${srcdir}/libfcitx5platforminputcontextplugin.so" "${pkgdir}/usr/lib/rstudio/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"
}
