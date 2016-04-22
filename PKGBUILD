# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.6
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('51a1a00c0985335cb703153ef7ec210fc0909f5b8f5c879e95ede78095260abc8ab0cccd98c29ee23b5dad17e0d52cf1b7469965a80b11b7d525d437e14c51ef')

package() {
	install -d "$pkgdir/usr/include"
	install -m 644 -t "$pkgdir/usr/include/" "$srcdir/cloudabi-${pkgver}/headers/"*
}
