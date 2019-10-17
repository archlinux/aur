# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-sarasa-slab
pkgver=0.10.0
pkgrel=1
pkgdesc="Mono-slab variants for Sarasa Gothic"
arch=('any')
url="https://github.com/CyanoHao/Sarasa-Alternatives"
license=('custom: SIL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/CyanoHao/Sarasa-Alternatives/releases/download/v${pkgver}/sarasa-slab-ttc-${pkgver}.7z"
	"https://raw.githubusercontent.com/CyanoHao/Sarasa-Alternatives/master/LICENSE")
md5sums=('112c3d254f049c9c93a9623dfc72927e'
         '8ff57183e6df3ffbe6248fa831090a5f')

package() {
	install -d "${pkgdir}/usr/share/fonts/${pkgname:4}"
	install -m644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname:4}"
	install -Dm644 "${srcdir}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
