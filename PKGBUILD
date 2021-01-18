# Maintainer: Seth Flynn <g3tchoo@protonmail.com>

pkgname=aur-update
_pkgname=aur-update
pkgver=0.1.0
pkgrel=1
pkgdesc="automatically update PKGBUILD files for the AUR"
arch=("any")
url="https://github.com/getchoo/aur-update"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('https://github.com/getchoo/aur-update/archive/v0.1.0.tar.gz')
md5sums=('657b502dc511d46adebcfa102cb8c1c6')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/local" install
}
