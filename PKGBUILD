# Maintainer: Francis C.
pkgname=rstudio-fcitx5
pkgver=2021.09.1.372
pkgrel=2
pkgdesc='Rstudio plugin for using Fcitx5'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-qt'
license=('LGPL')
depends=('rstudio-desktop-bin' 'fcitx5-qt')
source=("https://github.com/francistw/rstudio-fcitx5/raw/main/libfcitx5platforminputcontextplugin.so")
sha256sums=(f6f71170f19d23dc12cf6c38649b03e56e3b309b1a1459491b6e1a11476e7a6a)

package() {
	install -D "${srcdir}/libfcitx5platforminputcontextplugin.so" "${pkgdir}/usr/lib/rstudio/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"
}
