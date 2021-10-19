# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=11.r8.857c685
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell-extensions)
_commit=857c68537c8b01b295d9df8599f27e8b7eaa2721
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/${_commit}.tar.gz")
sha512sums=('0af40089f8ec4c96248a7141aacf74e4a151c2f09bb3fb69091121a6eaaf5e89bb093dcb464c47040bb69753d798e93119911b7cf8406f8bc5748f89f2013a14')

package() {
	cd no-overview-${_commit}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
