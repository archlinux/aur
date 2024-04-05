pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.9'
pkgrel=1
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('1d5acc685793d4bdfdac17516b5eb639cbf4156f0b7a7d21db6c91c0cb2c0bbb')
b2sums=('e3b1ccc61267c84c7e92fa4c5f5c8cdc3c2a18a64b656bf6d220747f5b9fa5a308709830a3cb842de9f730840c55dacd26c8c64f5001bc124acd21286f9cc433')

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
	cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
