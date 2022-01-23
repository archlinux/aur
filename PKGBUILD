# Maintainer: Jeremy Reed <reeje76@gmail.com>

pkgname=encpass.sh
pkgver=4.1.5
pkgrel=1
pkgdesc="lightweight solution for using encrypted passwords in shell scripts"
arch=('any')
url="https://github.com/plyint/encpass.sh"
license=('MIT')
depends=('bash' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plyint/encpass.sh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("213f4480319f13749cbb364e16a5b23464744396b56ec39457f4ae80e4c64b35")

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 encpass.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
