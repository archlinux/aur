# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.9
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('d803c1ebb8a7651c4158f2ba42a8c2ecbe7c4752c13924ec9c26c0f2340295069c9c2aeaa44b1424a7dc6ecf21f36d52bcf7c3162028398b8157c9557feea1f2')

package() {
	install -d "$pkgdir/usr/include"
	install -m 644 -t "$pkgdir/usr/include/" "$srcdir/cloudabi-${pkgver}/headers/"*
}
