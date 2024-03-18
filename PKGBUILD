pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.7'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('369df0125dc77281414f798ab75c5ed7bb46f0031c3c84e3731cd7e936ba2346')
b2sums=('60d27985a519b979f88354fd16c553b3f4a170d6bd956f566ea5445e4f05ec3f9107dda8990c3b1b1bb1897db4c825a128f10c9f18e2c2eea826461fc9cf8ccb')

package() {
	install -dm777 "${pkgdir}/opt/LiteLoader"
	find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
