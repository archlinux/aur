# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.7
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('16f281a5ac5eb3ec84f2cb91c8d2dd9bf34638b7d9b77fc54d2356244cf446bf6ebbd94a0e0d7960091080504505c7657348e407f9668679b207db92afefd417')

package() {
	install -d "$pkgdir/usr/include"
	install -m 644 -t "$pkgdir/usr/include/" "$srcdir/cloudabi-${pkgver}/headers/"*
}
