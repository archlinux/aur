# Maintainer: Your Name <martinp6282@gmail.com>
pkgname=sysi
pkgver=1.0.2
pkgrel=2
pkgdesc="A simple script to display system information"
arch=('any')
url="https://github.com/stuffbymax/sysi"
license=('MIT')
depends=('lm_sensors' 'procps-ng' 'pacman' 'glib2' 'bash' 'filesystem' 'gawk' 'coreutils' 'ncurses' 'upower' 'sysstat' 'xorg-xrandr' 'pciutils' 'ttf-iosevka-nerd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stuffbymax/sysi/archive/refs/tags/1.0.2.tar.gz")
sha256sums=('70e5b07564986a221d054088ff00209b0ff9c25b00ea78d6289dcad288cfdbdd')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sysi "$pkgdir/usr/bin/sysi"
}
