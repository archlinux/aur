# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-xx_ent_wiki_sm
pkgver=2.3.0
pkgrel=1
pkgdesc="Multi-lingual CNN trained on Nothman et al. (2013) Wikipedia corpus for spaCy"
url="https://spacy.io/models/xx#section-xx_ent_wiki_sm"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('CCPL')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/xx_ent_wiki_sm-${pkgver}/xx_ent_wiki_sm-${pkgver}.tar.gz")
sha256sums=('f686c0ba1c1144d7601e0c037247802bc98249ae6ee65b6c237016ba7cad7f74')

build() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py build
}

package() {
    cd xx_ent_wiki_sm-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
