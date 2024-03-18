pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.4'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('f86c576530853a5dfd5bdabb46be8a5a34895e3ee0af55eb22f183b89c3dbb42')
b2sums=('f1152c0032deeabbe19fc21ba1bf0697bf296161f2ecf402045b88b255407046942a5a0de13862e2e5ce5f2493ac0266b1f32439ae0effd99e02cf5e1e3fa70f')

package() {
	install -dm777 "${pkgdir}/opt/LiteLoader"
	find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
