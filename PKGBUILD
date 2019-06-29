# Maintainer: Will Price <will.price94@gmail.com>

_version=2018-10-05
_lang=english
pkgname=stanford-corenlp-models-$_lang
pkgver=3.9.2
pkgrel=3
pkgdesc="Parser models for the $_lang language for the Stanford parser."
arch=(any)
url="https://nlp.stanford.edu/software/lex-parser.shtml"
license=('GPL')
groups=(stanford-corenlp-models)
depends=(java-runtime)
source=("https://nlp.stanford.edu/software/stanford-${_lang}-corenlp-${_version}-models.jar")
noextract=("stanford-${_lang}-corenlp-${_version}-models.jar")

package() {
    mkdir -p "${pkgdir}"/usr/share/stanford-corenlp/models
    cp  "stanford-${_lang}-corenlp-${_version}-models.jar" \
        "${pkgdir}/usr/share/stanford-corenlp/models"
}
sha512sums=('68dcc2bb1e6747f41a8922babe0f171fdbcb7542fd9c46f443ae1e777a16369d8645a8a40acfa29596af0f7874bd114e822756170f23dc1dd52e9743ae481db5')
