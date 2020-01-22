# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=2.2.0
pkgrel=2
pkgdesc="Multi-lingual CNN trained on Nothman et al. (2013) Wikipedia corpus for spaCy"
url="https://spacy.io/models/xx#section-xx_ent_wiki_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('4b43fff832b3e690f1ba37ace5d57d40100e725d1a3771bd4851aa5643b33c5a')

build() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py build
}

package() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
