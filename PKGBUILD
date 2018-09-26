# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=wiking
pkgver=1.0.0
pkgrel=1
pkgdesc="Next generation wiki written in Django with Markdown support"
arch=(any)
url="https://gitlab.com/XenGi/WikiNG"
license=('MIT')
#makedepends=('')
#backup=()
source=("${pkgname}::git+https://gitlab.com/XenGi/WikiNG.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	#./configure --prefix=/usr
	#make
}

package() {
	cd "$srcdir/$pkgname"
	#make DESTDIR="$pkgdir/" install
}
