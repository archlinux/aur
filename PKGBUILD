# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
pkgver=0.12.0
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('i686' 'x86_64')
url='https://www.dulwich.io/'
license=('GPL2')
depends=('python')
source=("https://pypi.python.org/packages/source/d/dulwich/dulwich-${pkgver}.tar.gz")

package() {
  cd "dulwich-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('8f9070f37eec6175aab60d7064246b5b6453b2fab342589101f1c8feda0a0cc6')
sha384sums=('8059b924d92d1001e911868ce7e272b0489c1e36be7da4e5278a77f0f17fe745524857e78fa2dd700b9dbf50b0ea213a')
sha512sums=('55062a89d77294df849a8f59e0dd25c4d557fc3ea8e2de2c114c510ebe15ba876be54fad0889f1475855e3bf986f91e04b819dad3fe61f23b399553b59b26302')
