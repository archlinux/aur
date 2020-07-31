# Maintainer: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=0.50
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=(any)
url="https://www.kutilek.de/sudo-font/"
license=(SIL)
install=ttf-sudo.install
depends=(fontconfig xorg-font-utils)
source=("https://github.com/jenskutilek/sudo-font/archive/v${pkgver}.tar.gz")
md5sums=('0cca8420448f28489564993bdbd3706c')

package() {
  for font in "$srcdir/sudo-font-$pkgver/sudo/"Sudo*.ttf; do
    install -Dm644 "$font" \
                   "$pkgdir/usr/share/fonts/sudo-font/$(basename "$font")"
  done
}

# vim:set ts=2 sw=2 et:
