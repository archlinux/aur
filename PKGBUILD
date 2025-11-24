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
sha256sums=('4098e568510ea4e8e149ea23864f8df562277e12184e7621d7c1628258d6b17d')

package() {
    install -Dm755 "$srcdir/ewwii" "$pkgdir/usr/bin/ewwii"
}
