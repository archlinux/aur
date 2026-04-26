# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii-bin
pkgver=0.6.0
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
sha256sums=('672d954807fc47c6a11f7a913717ddb09f4a54b99d7598f6081b36aa1f7379e2')

package() {
  install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
