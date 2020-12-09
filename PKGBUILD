# Maintainer: Midov <midov@midov.pl>

pkgname=python-dataclasses
_name=dataclasses
pkgver=0.8
pkgrel=1
pkgdesc="Implementation of PEP 557, Data Classes."
arch=('any')
url="https://pypi.org/project/dataclasses/"
license=('GPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae18766d93c59fe5/dataclasses-0.8.tar.gz")
sha256sums=('8479067f342acf957dc82ec415d355ab5edb7e7646b90dc6e2fd1d96ad084c97')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
