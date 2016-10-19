# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=rofi-mpd
pkgver=0.1.0
pkgrel=1
pkgdesc="Script for controlling mpd through rofi."
arch=('any')
url="https://github.com/Prior99/mopidy-subidy"
license=('GPL3')
depends=(
    'mpc'
    'zsh')
provides=('rofi-mpd')
source=("https://github.com/prior99/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7cb8666c26002e3586198f8aebd9ac808c19eced196434980fa3fe3346f26f00')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 rofi-mpd.zsh "${pkgdir}/usr/bin/rofi-mpd"
}
