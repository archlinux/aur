# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.4.0
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
sha256sums=('ac6b29f4b845d6ddb9d6d95dbe00170fcbdf128b35a4b1ff581e8b0237ff1b19')

package() {
    install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
