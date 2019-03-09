# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=2.1.0a7
pkgrel=1
pkgdesc="English multi-task CNN trained on OntoNotes, with GloVe vectors trained on Common Crawl for spaCy"
url="https://spacy.io/models/xx#section-xx_ent_wiki_sm"
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('1d07e7a7acbc1750c680c687725eabc836f094b8eeaf1a1b7c7901d5e4b67fdc')

build() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py build
}

package() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
