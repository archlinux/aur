# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=opmsg
pkgver=1.2s
_pkgver=rel-"${pkgver}"
pkgrel=1
epoch=
pkgdesc="opmsg message encryption"
arch=('x86_64' 'i686')
url="https://github.com/stealth/opmsg"
license=('GPL3')
depends=('openssl')
source=("https://github.com/stealth/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('308ee318a3ae1c264d653d6f3b387303')

build() {
	cd "$pkgname-$_pkgver"
	make
}

package() {
	cd "$pkgname-$_pkgver"
  install -D -m755 opmsg "$pkgdir/usr/bin/opmsg"
}
