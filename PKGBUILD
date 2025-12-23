# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Powerful and flexible widget system for Linux"
arch=('x86_64')
url="https://github.com/Ewwii-sh/ewwii"
license=('GPL')
depends=()
makedepends=()
provides=('ewwii')
conflicts=('ewwii' 'ewwii-git')
source=("https://github.com/Ewwii-sh/ewwii/releases/download/v${pkgver}/ewwii")
sha256sums=('49eff35932e5d364e9a8ade4375e2bf3cfb4702bea9bbda4a56202df8a4d18a3')

package() {
    install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
