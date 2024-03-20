pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.8'
pkgrel=2
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('09292ad50fdf0e60c2d9ef370d40ccb6ebedf3f8bf2499c35902536f7b0957d9')
b2sums=('5c903b6680eb987f4f0be98c73b8adeac50b4a489815f937b3c1f6c3f74324be99ae1ac22ee5cdad148da9c50c849370fb4fb77afb725437668757f1a41a051d')

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
	cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
