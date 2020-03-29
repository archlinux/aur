# Maintainer: Midov <midov@midov.pl>

pkgname=python-dataclasses
_name=dataclasses
pkgver=0.7
pkgrel=1
pkgdesc="Implementation of PEP 557, Data Classes."
arch=('any')
url="https://pypi.org/project/filetype/"
license=('GPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/7a/71/fdbab71f1f714e03ead2d264bf444f88379bc09b2937d54ec83894057f80/${_name}-${pkgver}.tar.gz")
sha256sums=('494a6dcae3b8bcf80848eea2ef64c0cc5cd307ffc263e17cdf42f3e5420808e6')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
