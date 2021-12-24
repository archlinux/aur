# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Johannes Titz <johannes.titz@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-bidi
pkgver=0.4.2
pkgrel=3
pkgdesc="BIDI algorithm related functions"
url="https://github.com/MeirKriheli/python-bidi"
license=('LGPL3')
arch=('any')
depends=('python')
source=("https://github.com/MeirKriheli/python-bidi/archive/v${pkgver}/python-bidi-${pkgver}.tar.gz")
sha256sums=('937295ce1369a329fabd6152be4212d6a4d80d6c278846580eabde0c1dd33077')

build() {
  cd python-bidi-${pkgver}
  python setup.py build
}

package() {
  cd python-bidi-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --prefix=/usr --optimize=1
}
