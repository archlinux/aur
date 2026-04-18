# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.5.0
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
sha256sums=('2a4c4bc43801b62f8ed0e5b966cfedbad8db8285e9649400216eccfb2746cc0a')

package() {
  install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
