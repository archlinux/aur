# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad-ru
pkgver=4.2.4
pkgrel=1
pkgdesc="Russian translate for XtrkCAD program."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('xtrkcad')
optdepends=()
makedepends=('gettext')
conflicts=()
provides=()
backup=()
source=("https://raw.githubusercontent.com/CupIvan/${pkgname}/master/${pkgver}/xtrkcad.po")
md5sums=("SKIP")

build() {
	msgfmt xtrkcad.po -o xtrkcad.mo
}

package() {
	install -Dm644 "xtrkcad.mo" "${pkgdir}/usr/share/locale/ru/LC_MESSAGES/xtrkcad.mo"
}
