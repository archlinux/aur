# Maintainer: Will Price <will.price94@gmail.com>

_version=2017-06-09
_lang=english
pkgname=stanford-corenlp-models-$_lang
pkgver=3.8.0
pkgrel=1
pkgdesc="Parser models for the $_lang language for the Stanford parser."
arch=(any)
url="https://nlp.stanford.edu/software/lex-parser.shtml"
license=('GPL')
groups=(stanford-corenlp-models)
depends=(java-runtime stanford-parser)
source=("https://nlp.stanford.edu/software/stanford-${_lang}-corenlp-${_version}-models.jar")
md5sums=('d8e04b649c28b87465eccc263d9b827e')
noextract=("stanford-${_lang}-corenlp-${_version}-models.jar")

package() {
    mkdir -p "${pkgdir}"/usr/share/stanford-parser
    cp  "stanford-${_lang}-corenlp-${_version}-models.jar" \
        "${pkgdir}/usr/share/stanford-parser/"
}
