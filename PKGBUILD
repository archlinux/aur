# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.9.0
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
sha256sums=('98cf70a2b5839c6e808f567c432e95fc41f9ce581f8950fc61b04211b8fc1986')

package() {
  install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
