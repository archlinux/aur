# Maintainer: Jonathan Wright <jon@than.io>

pkgname=boundary-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Network resources access controller"
arch=('x86_64')
url="https://github.com/hashicorp/boundary"
license=('MPL2')
makedepends=('unzip')

source=("boundary-${pkgver}::https://releases.hashicorp.com/boundary/${pkgver}/boundary_${pkgver}_linux_amd64.zip")
sha512sums=('4783c50fafa68f22c2c053d172aed135e9740323b2088d56d9443d97ecb247004eb2309085cf59cd18acdc756c9e1d73cde7df5acecf8710f1a75f2e9e9f2b07')

package() {
	install -D -g root -m 0755 -o root "$srcdir/boundary" "$pkgdir/usr/bin/boundary"
}
