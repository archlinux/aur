# Maintainer: Your Name <martinp6282@gmail.com>
pkgname=sysi
pkgver=1.0.9
pkgrel=4
pkgdesc="A simple script to display system information"
arch=('any')
url="https://github.com/stuffbymax/sysi"
license=('MIT')
depends=('lm_sensors' 'procps-ng' 'pacman' 'glib2' 'bash' 'filesystem' 'gawk' 'coreutils' 'ncurses' 'upower' 'sysstat' 'xorg-xrandr' 'pciutils' 'ttf-iosevka-nerd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stuffbymax/sysi/archive/refs/tags/1.0.9.tar.gz")
sha256sums=('1adc1b71c65b11d83261266935af54ea')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sysi "$pkgdir/usr/bin/sysi"
}
