# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-btrfs-heatmap
pkgver=v5
pkgrel=1
pkgdesc="Python Btrfs HeatMap"
arch=('any')
url="https://github.com/knorrie/btrfs-heatmap"
license=('GPL3')
depends=('python-btrfs')
source=("$pkgname"::"git://github.com/knorrie/btrfs-heatmap.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/${pkgname}/"
    install -Dm755 ./heatmap.py "$pkgdir/usr/bin/btrfs-heatmap"
}
