# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.8
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('0cb1ce3cf752f102f8e85772dda8ee8ee5df4f0c0f68b64c19deb26eff809b37adc7d97fd876698675e18f96987943dbee79596028b4c4d36bffe5cf81ba657d')

package() {
	install -d "$pkgdir/usr/include"
	install -m 644 -t "$pkgdir/usr/include/" "$srcdir/cloudabi-${pkgver}/headers/"*
}
