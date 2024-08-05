# Maintainer: Your Name <martinp6282@gmail.com>
pkgname=sysi
pkgver=1.0.3
pkgrel=3
pkgdesc="A simple script to display system information"
arch=('any')
url="https://github.com/stuffbymax/sysi"
license=('MIT')
depends=('lm_sensors' 'procps-ng' 'pacman' 'glib2' 'bash' 'filesystem' 'gawk' 'coreutils' 'ncurses' 'upower' 'sysstat' 'xorg-xrandr' 'pciutils' 'ttf-iosevka-nerd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stuffbymax/sysi/archive/refs/tags/1.0.3.tar.gz")
sha256sums=('97535d8109ac34b9767b6837fb3ed532819d402b219a6c490337003cc61a4192')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sysi "$pkgdir/usr/bin/sysi"
}
