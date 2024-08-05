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
sha256sums=('d5f6c901d12837c76a6c2eb4c604559921b13f806b03762abb182ff363d03c87')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sysi "$pkgdir/usr/bin/sysi"
}
