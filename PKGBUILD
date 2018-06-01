# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=blockstack-browser
pkgver=0.29.1
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
md5sums=('4527a26539a15e78fdfcccf0671680c8')

package() {
	cd $srcdir/$pkgname-$pkgver
	npm install -g --user root --prefix "$pkgdir"/usr
}
