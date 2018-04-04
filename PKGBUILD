# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=blockstack-browser
pkgver=0.26.2
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('')
groups=()
depends=('nodejs')
makedepends=('npm')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/blockstack/blockstack-browser/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname-$pkgver
	npm install -g --user root --prefix "$pkgdir"/usr
}
