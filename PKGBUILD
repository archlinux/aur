# Maintainer: Jonas Van der Aa <ketsukonn@gmail.com>

pkgname='dxtractor-bin'
pkgver='1.0.0'
pkgrel=3
pkgdesc='Collect DXVK Cache files from your system'
url='https://github.com/NastyGamer/DXVKache'
arch=('x86_64')
depends=()
license=('Apache')
provides=('dxtractor' "dxtractor=$pkgver")
source=("https://github.com/NastyGamer/DXVKache/releases/download/$pkgver/DXtractor-$pkgver")
sha256sums=('4a07bcc71cd5b1885747272e911970b66e6acc166ab429dbca9a6cb7a69eab4e')

package_dxtractor-bin () {
    install -D "DXtractor-$pkgver" -T "$pkgdir/usr/bin/dxtractor"
}