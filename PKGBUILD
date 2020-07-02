# Maintainer: John Lane <archlinux at jelmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=pyzor
pkgver=1.0.0
pkgrel=2
pkgdesc="Detect and block spam using identifying digests of messages."
arch=('any')
url="https://github.com/SpamExperts/pyzor"
license=('GPL')
makedepends=('python-setuptools')
depends=('python')
#source=(https://pypi.python.org/packages/source/p/pyzor/${pkgname}-${pkgver}.tar.gz)
source=(https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('10ea114bdee2eee5edd6afe8eeddaaf605620445977ae019a3e9b1cbb6bc3b27')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
