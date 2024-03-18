pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.2.5'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('efc8b1317646ef524f0f83501a73cbabf7611c680e99bbdac33bc17c0fc4182b')
b2sums=('80b7f9011b16c957512241b5fb6dcef63d55be91bdd5f1d5073c71f6c320252a123aa6523d1b06f6c1b648bda22b61df822099499444ac30ced0f1f7cfcff4ad')

package() {
	install -dm777 "${pkgdir}/opt/LiteLoader"
	find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
