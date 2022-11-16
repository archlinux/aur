# Maintainer: mohsen <smoka7 at hotmail dot com>

pkgname=mona-sans
pkgver=1.0
pkgrel=1
pkgdesc="Mona Sans, a variable font from GitHub"
arch=('any')
license=('OFL')
url="https://github.com/github/mona-sans"
source=("https://github.com/github/mona-sans/releases/download/v${pkgver}/Mona.Sans.${pkgver}.zip"
        "https://github.com/github/mona-sans/raw/v${pkgver}/LICENSE")
sha256sums=('SKIP' 'SKIP')
package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 Mona\ Sans/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 Mona\ Sans/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
