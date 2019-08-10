# Contributor: Jake Mannens <jakem_5@hotmail.com>
pkgname=powertool
pkgver=0.1
pkgrel=2
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
md5sums=('d9015fecbf5a803323db745fd6a2bcd9')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
