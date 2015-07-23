# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-textseg
_pkgname=pytextseg
pkgver=0.2.0
pkgrel=1
pkgdesc="Python module for text segmentation"
arch=('any')
url="https://pypi.python.org/pypi/pytextseg/"
license=('GPL')
makedepends=("python2-distribute")
depends=('python2')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {
  cd "${srcdir}/$_pkgname-$pkgver"
  python2 setup.py install --root "${pkgdir}"
}

sha512sums=('d4c73ba9b371f0994b6e32bb16ce2959893389f851a762c0d316a24728b2867e1863db10bb2836acf5c491bdc569396cb0d65f86f797401994ca94bb16504831')
