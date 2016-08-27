# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=withtool
pkgver='v2.1'
url="https://github.com/kalterfive/with"
pkgrel=1
pkgdesc="Program prefixing for continuous workflow using a single tool"
arch=(any)
license=('GPL3')
depends=(bash)
source=("with::git://github.com/kalterfive/with#tag=$pkgver")
md5sums=('SKIP')

function package() {
	cd 'with'
	DESTDIR="$pkgdir" ./install.sh
}

