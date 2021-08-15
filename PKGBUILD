# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=python-immutabledict
pkgver=2.1.0
pkgrel=2
pkgdesc="Immutable wrapper around dictionaries (a fork of frozendict)"
arch=('any')
url="https://pypi.org/project/immutabledict"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/ea/74/b3e2ada437a2c1b171a7cb6cdcefd43da80e9591b917ec7cebd72d273aa8/immutabledict-$pkgver.tar.gz")
sha512sums=('88e29ed26b22e4cd77acb6bc562f8b5a688b39dca0ff25713fb020007cbf63915877d5a9e5846e45947c44cce34a8035c43498fbddb0c507bfca22dca3a67b8c')

package() {
  cd ${srcdir}/immutabledict-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

