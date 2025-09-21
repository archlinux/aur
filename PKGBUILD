# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.1.4
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
sha256sums=('97ff5d3f05aa5795d742feb23b88619f5794ff4e9084b8b7f4c958b348488a46')

package() {
    install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
