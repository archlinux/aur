# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-sarasa-slab
pkgver=0.10.2
pkgrel=1
pkgdesc="Mono-slab variants for Sarasa Gothic"
arch=('any')
url="https://github.com/CyanoHao/Sarasa-Alternatives"
license=('custom: SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/CyanoHao/Sarasa-Alternatives/releases/download/v${pkgver}/sarasa-slab-ttc-${pkgver}.7z"
	"https://raw.githubusercontent.com/CyanoHao/Sarasa-Alternatives/master/LICENSE")
md5sums=('a9ef56c030956a34150433340a1b6d98'
         'bb894d46cb6fb06cd086a58828eee132')

package() {
	install -d "${pkgdir}/usr/share/fonts/${pkgname:4}"
	install -m644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname:4}"
	install -Dm644 "${srcdir}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
