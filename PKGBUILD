# Maintainer: Jeremy Reed <reeje76@gmail.com>

pkgname=encpass.sh
pkgver=4.1.4
pkgrel=2
pkgdesc="lightweight solution for using encrypted passwords in shell scripts"
arch=('any')
url="https://github.com/plyint/encpass.sh"
license=('MIT')
depends=('bash' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plyint/encpass.sh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("429aa9776fc403a5490a9063ae1419967f7894186e86e20368e288138d93540e")

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 encpass.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
