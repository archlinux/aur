# Maintainer: Will Price <will.price94@gmail.com>

_version=2018-02-27
_lang=english
pkgname=stanford-corenlp-models-$_lang
pkgver=3.9.1
pkgrel=3
pkgdesc="Parser models for the $_lang language for the Stanford parser."
arch=(any)
url="https://nlp.stanford.edu/software/lex-parser.shtml"
license=('GPL')
groups=(stanford-corenlp-models)
depends=(java-runtime)
source=("https://nlp.stanford.edu/software/stanford-${_lang}-corenlp-${_version}-models.jar")
sha512sums=('ca4700953f59a40a4092f79602f29c92125a82c50791db5c14f3712d1a23e7e4b9a7cb92d30f6599b23ddf1cd32a38f3577622cec30076db5611c12fe0396974')
noextract=("stanford-${_lang}-corenlp-${_version}-models.jar")

package() {
    mkdir -p "${pkgdir}"/usr/share/stanford-corenlp/models
    cp  "stanford-${_lang}-corenlp-${_version}-models.jar" \
        "${pkgdir}/usr/share/stanford-corenlp/models"
}
