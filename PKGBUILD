# Maintainer: nomisge <nomisge @ live . de>
pkgname=asciidoctor-revealjs
pkgver=5.1.0
pkgrel=1
pkgdesc="Asciidoctor reveal.js is a converter for Asciidoctor and Asciidoctor.js that transforms an AsciiDoc document into an HTML5 presentation designed to be executed by the reveal.js presentation framework."
arch=('any')
url="https://github.com/asciidoctor/asciidoctor-reveal.js"
license=('MIT')
groups=()
depends=()
source=("https://github.com/asciidoctor/asciidoctor-reveal.js/releases/download/v$pkgver/${pkgname}-linux")
sha256sums=('9639870b9dd032a8aa36567e39ce3c0572e5614559597ce4095637eb7fc5c415')
options=(!strip !docs)

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/asciidoctor-revealjs-linux" "${pkgdir}/usr/bin/${pkgname}"
}
