# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-nl_core_news_sm
pkgver=2.1.0a7
pkgrel=2
pkgdesc="Dutch multi-task CNN trained on the Universal Dependencies and WikiNER corpus for spaCy"
url="https://spacy.io/models/nl#section-nl_core_news_sm"
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/nl_core_news_sm-${pkgver}/nl_core_news_sm-${pkgver}.tar.gz")
sha256sums=('0ef11af5cac084f5d5110bf163e1f6ddb3575fd1e6ff64aee4e09140dbf7e1ea')

build(){
    cd nl_core_news_sm-${pkgver}
    python setup.py build
}

package(){
    cd nl_core_news_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
