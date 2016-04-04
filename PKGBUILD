# Maintainer: Ramon <https://github.com/ram-on/imgurbash2>

pkgname=imgurbash2
pkgver=1.0
pkgrel=1
pkgdesc="A shell script that uploads images to imgur."
arch=('any')
url="https://github.com/ram-on/imgurbash2"
license=('MIT')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
			'xclip: an alternative to xsel')
source=('https://github.com/ram-on/imgurbash2/archive/1.0.tar.gz')
sha256sums=('9c6a3fb61e995a9bafccc10e8196c009f467db039cc3791ebc33d75f331d0b48')

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
