# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=pdfannots2json-bin
pkgver=1.0.16
pkgrel=1
pkgdesc="Extracts annotations from PDF and converts them to a JSON list"
arch=('x86_64')
url="https://github.com/mgmeyers/pdfannots2json"
license=('AGPL-3.0-only')
options=("!debug")
source=(pdfannots2json.Linux.x64.tar.gz::https://github.com/mgmeyers/pdfannots2json/releases/download/${pkgver}/pdfannots2json.Linux.x64.tar.gz)
sha512sums=('04b7feeb2ce9a9b16baa6e895cda8f8114209dd98e14e2db17ab9bd3d9b1006a70acbb91e478bef551c877417fb7194eae669b1b762a49a4e560aeeaf9147a33')

package() {
    install -Dm755 "${srcdir}/pdfannots2json" "${pkgdir}/usr/bin/pdfannots2json"
}
