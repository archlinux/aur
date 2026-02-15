# Maintainer: rapoyrazoglu
pkgname=nihongo
pkgver=1.5.7
pkgrel=1
pkgdesc="JLPT Japanese learning app - SRS, quiz, kanji, grammar"
arch=('x86_64')
url="https://github.com/rapoyrazoglu/nihongo"
license=('MIT')
depends=('espeak-ng')
optdepends=('fcitx5-mozc: Japanese input')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/nihongo-linux")
sha256sums=('adf2e44075e015fa02a862c101261cf48d117a37cc93f506ac4964ff05723ec9')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nihongo"
}
