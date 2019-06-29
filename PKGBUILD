# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Will Price <will.price94@gmail.com>

_version=2018-10-05
_lang=german
pkgname=stanford-corenlp-models-$_lang
pkgver=3.9.2
pkgrel=1
pkgdesc="Parser models for the $_lang language for the Stanford parser."
arch=(any)
url="https://nlp.stanford.edu/software/lex-parser.shtml"
license=('GPL')
groups=(stanford-corenlp-models)
depends=(java-runtime)
source=("https://nlp.stanford.edu/software/stanford-${_lang}-corenlp-${_version}-models.jar")
sha512sums=('f3eed9f790d91ffea8164eb40c7c514e7ad5bf263916be4c8879407eb53839a111a44a22dbf6734ab7facc8f5cd8e4afa92bfeac9777f042796f457e3129bfb7')
noextract=("stanford-${_lang}-corenlp-${_version}-models.jar")

package() {
    mkdir -p "${pkgdir}"/usr/share/stanford-corenlp/models
    cp  "stanford-${_lang}-corenlp-${_version}-models.jar" \
        "${pkgdir}/usr/share/stanford-corenlp/models"
}
