# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=2.1.0
pkgrel=2
pkgdesc="Multi-lingual CNN trained on Nothman et al. (2013) Wikipedia corpus for spaCy"
url="https://spacy.io/models/xx#section-xx_ent_wiki_sm"
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('c4ddb14377ec86581e59b1f1ee18740c3f08a45f90ac374875f4372c79d74ea7')

build() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py build
}

package() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
