# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname=python-casefy
pkgver=0.1.1
pkgrel=1
pkgdesc='Utilities to convert the case of strings'
arch=('any')
url='https://pypi.org/project/casefy'
license=('MIT')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/15/8e/fa556937d382db9717b529fe4337d159579761b61543068fe1eaec4f2793/casefy-0.1.1.tar.gz")
sha256sums=('b3aa0a9b295c50132347ebc629a4bdfda7968a09ebc32d1954f4a235bbc184eb')

package() {
    cd "${srcdir}/casefy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
