# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Eww fork with focus on extensibility, flexibility, and power."
arch=('x86_64')
url="https://github.com/Ewwii-sh/ewwii"
license=('GPL')
depends=()
makedepends=()
provides=('ewwii')
conflicts=('ewwii' 'ewwii-git')
source=("https://github.com/Ewwii-sh/ewwii/releases/download/v${pkgver}/ewwii")
sha256sums=('e9870548d39165edb3f4c313e3d6060776ffcf3b13461856b4ffcf2be53cfef3')

package() {
  install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
