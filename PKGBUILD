pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.6'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('b378310682a75e474585109a72a27ee0bb3b73dc4445280a6b8de8bc737272df')
b2sums=('127a93c21901902c46dfd68c0374b2cd2d07012d9a9883ccdd6b70387c3cafb82003952af201864e9623e352faa7c210883d75cf28a1c9be30be602a743af37a')

package() {
	install -dm777 "${pkgdir}/opt/LiteLoader"
	find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
