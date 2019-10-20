# Maintainer: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=0.40
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=(any)
url="https://www.kutilek.de/sudo-font/"
license=(SIL)
install=ttf-sudo.install
depends=(fontconfig xorg-font-utils)
source=("https://github.com/jenskutilek/sudo-font/archive/v${pkgver}.tar.gz")
md5sums=('b4428fc26e85066152961719d75ae323')

package() {
  for font in "$srcdir/sudo-font-$pkgver/sudo/"Sudo*.ttf; do
    install -Dm644 "$font" \
                   "$pkgdir/usr/share/fonts/sudo-font/$(basename "$font")"
  done
}

# vim:set ts=2 sw=2 et:
md5sums=('fb13ae5477150ee8e25476b10a2a038e')
