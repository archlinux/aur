# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=markdown-urlize
_pkgname=markdown-urlize
pkgver=0.2.0
pkgrel=1
pkgdesc='A more liberal autolink extension for python Markdown'
arch=(any)
url=https://github.com/r0wb0t/markdown-urlize
license=('MIT')
depends=()
makedepends=(python-setuptools unzip)
source=(git://github.com/r0wb0t/markdown-urlize.git)
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}