pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.3.0'
pkgrel=1
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('b40185506e3240aa84736c340415236c8406c08ea5129541750b4b90128f6f47')
b2sums=('9ada3f50fe284624f107492d74513968cc88d9f478a2c8d97a257f0aa1d9d58f5a027566c4d2541531c95855c3588f597743940f6e9817bab55bf7b96b21a749')

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
	cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
