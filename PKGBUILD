# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=opmsg
pkgver=1.5s
_pkgver=rel-"${pkgver}"
pkgrel=1
epoch=
pkgdesc="opmsg message encryption"
arch=('x86_64' 'i686')
url="https://github.com/stealth/opmsg"
license=('GPL3')
depends=('openssl')
source=("https://github.com/stealth/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('c136b11c46c71e038aaf7169727d748b')

build() {
	cd "$pkgname-$_pkgver"
	make
}

package() {
	cd "$pkgname-$_pkgver"
  install -D -m755 opmsg "$pkgdir/usr/bin/opmsg"
}
