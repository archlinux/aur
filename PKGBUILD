# Maintainer: Jack Wu <origincoder@yahoo.com>
pkgname=bilibili-live-helper
pkgver=1.1.2
pkgrel=1
pkgdesc="Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=('cairo' 'libxtst' 'libxi' 'gtk2' 'libxrandr' 'pango' 'fontconfig' 'libxss' 'gdk-pixbuf2' 'nss' 'freetype2' 'nspr' 'gconf' 'libxext' 'libxdamage' 'atk' 'libxrender' 'libxcomposite' 'libxcursor' 'libxfixes' 'libx11' 'alsa-lib' 'libcups')
makedepends=('tar' 'git')
build() {
	git clone https://github.com/OriginCode/AURFiles
	cp ./AURFiles/${pkgname}.tar.gz .
	tar xvf ./${pkgname}.tar.gz
}
package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r bilibili-live-helper/* "${pkgdir}/opt/${pkgname}"
}

