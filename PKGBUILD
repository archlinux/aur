# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=libpurple-lurch
_pkgname=lurch
pkgver=r31.3ac3915
pkgrel=1
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('i686' 'x86_64')
url="https://github.com/gkdr/lurch"
license=('GPL')
depends=()
makedepends=()
source=("$pkgname::git+https://github.com/gkdr/lurch.git"
        "$pkgname.install"
        )
sha256sums=('SKIP'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
install="$pkgname.install"

pkgver () {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
}

# vim:set ts=2 sw=2 et:
