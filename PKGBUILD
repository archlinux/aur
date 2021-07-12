# Maintainer: Seth Flynn <g3tchoo@protonmail.com>

pkgname=aur-update
_pkgname=aur-update
pkgver=0.1.2
pkgrel=1
pkgdesc="automatically update PKGBUILD files for the AUR"
arch=("any")
url="https://github.com/getchoo/aur-update"
depends=("curl")
license=("MIT")
depends=("curl")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('https://github.com/getchoo/aur-update/archive/refs/tags/v0.1.2.tar.gz')
md5sums=('1dc324301585aafa58d2b73553bde087')

install() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/local" install
}
