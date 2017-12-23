# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-codecov'
pkgver=2.0.10
pkgrel=1
pkgdesc="Hosted coverage reports for Github, Bitbucket and Gitlab"
arch=('x86_64')
url="https://pypi.python.org/pypi/codecov"
license=('Apache-2.0')
depends=('python' 'python-requests>=2.7.9' 'python-coverage')
makedepends=('python-setuptools')
checkdepends=('python-unittest2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/2f/f0/7953d35f10c36488451773fe0c56ec90c8703588b6d134a7434374870583/codecov-${pkgver}.tar.gz")
md5sums=('751f873eb9427e088e17f41d030fdeee')

package() {
  cd "${srcdir}/codecov-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
