# Maintainer: Your Name <martinp6282@gmail.com>
pkgname=sysi
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple script to display system information"
arch=('any')
url="https://github.com/stuffbymax/sysi"
license=('MIT')
depends=('lm_sensors' 'procps' 'pacman' 'glib2' 'bash' 'filesystem')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stuffbymax/sysi/archive/refs/tags/1.0.1.tar.gz")
sha256sums=('95932b3b14a8f59449c0897703a2b37e13f056dc94a361ed4d488453dad0c6e1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sysi "$pkgdir/usr/bin/sysi"
}
