# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=adobe-source-han-super-otc
pkgver=20190603
pkgrel=1
pkgdesc='Source Han & Noto CJK Mega/Ultra OTCs'
arch=('any')
url='https://github.com/adobe-fonts/source-han-super-otc'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-SourceHanNotoCJK.ttc::https://github.com/adobe-fonts/source-han-super-otc/releases/download/${pkgver}/SourceHanNotoCJK.ttc"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://github.com/adobe-fonts/source-han-super-otc/raw/${pkgver}/LICENSE.md")
sha256sums=('128edf85c23a4fabd6f169977b535ce4b10b7a66e80147676e33d2f3d66fbb98'
            '3005c0d62a1adfda2c8f8a9b2001f9d3c689acfd03b13365c079962380814bb9')

package() {
    install -Dm644 *.ttc -t ${pkgdir}/usr/share/fonts/TTF/
    install -Dm644 *LICENSE.md -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
