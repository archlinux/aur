# Contributor: Jake Mannens <jakem_5@hotmail.com>
pkgname=powertool
pkgver=0.2
pkgrel=1
pkgdesc="A simple power management script"
arch=('any')
url="https://gitlab.com/plasmicplexus/powertool"
license=('GPL3')
install=$pkgname.install
depends=('sudo')
optdepends=('brightnessctl: brightness control'
            'cpupower: CPU frequency control'
            'networkmanager: WiFi control'
            'tpacpi-bat: battery charge thresholds')
source=("https://gitlab.com/plasmicplexus/powertool/-/archive/$pkgver/powertool-$pkgver.tar.gz")
md5sums=('aa62793fa3e16bd429cc65033c1a6d2d')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
