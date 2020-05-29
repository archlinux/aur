# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kwpolska <kwpolska@kwpolska.tk>

pkgname=python2-unidecode
pkgver=1.1.1
pkgrel=3
pkgdesc='ASCII transliterations of Unicode text'
arch=(any)
url=https://github.com/avian2/unidecode
license=(GPL)
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=(git+https://github.com/avian2/unidecode.git#tag=unidecode-${pkgver})
sha256sums=(SKIP)

build() {
    cd unidecode
    python2 setup.py build
}

package() {
  cd unidecode
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
