# Maintainer: Jack Wu <origincoder@yahoo.com>
pkgname=bilibili-live-helper
pkgver=1.1.2
pkgrel=1
pkgdesc="A Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=('cairo' 'libxtst' 'libxi' 'gtk2' 'libxrandr' 'pango' 'fontconfig' 'libxss' 'gdk-pixbuf2' 'nss' 'freetype2' 'nspr' 'gconf' 'libxext' 'libxdamage' 'atk' 'libxrender' 'libxcomposite' 'libxcursor' 'libxfixes' 'libx11' 'alsa-lib' 'libcups')
makedepends=('tar' 'git')
source=('git+https://github.com/OriginCode/AURFiles')
md5sums=('SKIP')

build() {
	cd "$srcdir/AURFiles"
	tar xvf ./${pkgname}.tar.gz
}

package() {
	cp -r ${srcdir}/AURFiles/${pkgname} .
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r ./bilibili-live-helper/* "${pkgdir}/opt/${pkgname}"
}
