# Maintainer: Jeremy Reed <reeje76@gmail.com>

pkgname=encpass.sh
pkgver=4.1.3
pkgrel=1
pkgdesc="lightweight solution for using encrypted passwords in shell scripts"
arch=('any')
url="https://github.com/plyint/encpass.sh"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plyint/encpass.sh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("57df2fb14d5e79d617afdd14e254ada0fca03114bd3c59a22dc869208a92ed23")

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 encpass.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
