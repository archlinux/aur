pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.3'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('8165750f88d00ac34b4625aa3e33527bf09607c9c03860d879467e3af389a0d7')
b2sums=('4766217f0007dcf78dafe6742a7f216eb3d7416659354bb43d31f55e8a46c46cb0cc8dd9b9d01aaddd5e1f4dd151f694dfe1041cb4785a1539812c0aaf9e77af')

package() {
	install -dm777 "${pkgdir}/opt/LiteLoader"
	find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
