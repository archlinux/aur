# Maintainer: Seth Flynn <g3tchoo@protonmail.com>

pkgname=aur-update
_pkgname=aur-update
pkgver=0.1.1
pkgrel=2
pkgdesc="automatically update PKGBUILD files for the AUR"
arch=("any")
url="https://github.com/getchoo/aur-update"
depends=("curl")
license=("MIT")
depends=("curl")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('https://github.com/getchoo/aur-update/archive/v0.1.1.tar.gz')
md5sums=('7ee460a5bdab2355689b4170341ca89e')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/local" install
}
