# Maintainer: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=0.33
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=(any)
url="https://www.kutilek.de/sudo-font/"
license=(SIL)
install=ttf-sudo.install
depends=(fontconfig xorg-font-utils)
source=("https://github.com/jenskutilek/sudo-font/archive/v${pkgver}.tar.gz")
md5sums=('7738743f7b82c13d5aff95b3a8284a21')

package() {
  for font in Sudo{,-{Bold{,Italic},Italic}}.ttf; do
    install -Dm644 "$srcdir/sudo-font-$pkgver/sudo/$font" \
                   "$pkgdir/usr/share/fonts/sudo-font/$font"
  done
}

# vim:set ts=2 sw=2 et:
