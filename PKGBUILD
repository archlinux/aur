# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=2.0.0
pkgrel=1
pkgdesc="Dutch multi-task CNN trained on the Universal Dependencies and WikiNER corpus for spaCy"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
makedepends=('python-setuptools')
license=('CC BY-SA 3.0')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('1f79eedcb397f9bfdce88b771369ba576664daba111411e750bd65746530bd58')

build(){
    cd nl_core_news_sm-${pkgver}
    python setup.py build
}

package(){
    cd nl_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
