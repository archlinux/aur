# Maintainer: Veillain <veillainwertz@gmail.com>
pkgname=dotman
pkgver=0.1.0
pkgrel=1
pkgdesc="Very simple DOTfile MANager, fully coded in bash."
arch=("any")
url="https://github.com/veillain/dotman"
license=("GPL-3.0-or-later")
depends=("git")
provides=("dotman")
conflicts=("dotman")
source=("${pkgname}-${pkgver}::git+https://github.com/veillain/dotman.git")
sha256sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
    sudo cp -rf src/dotman /usr/bin/
}
