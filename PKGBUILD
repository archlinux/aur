# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_uncefact
_name=trytond_edocument_uncefact
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for electronic document UN/CEFACT"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5a5d5fe99379024a87fd127d213dbfb6fb0ea648bb47843b60e0b1c83f983537')
sha512sums=('517abd637b2c31d97f783d217ed821aed4a043ec46c47f7a5af64928957cb7c414dae0845a173f555262d2f4a97e63281b7783d0501c791becd4ba24a27f9f0f')
b2sums=('82af8ee8c270e678e09f6d1bedbaa30e377438c25eacfd27afad490bf928b641090ad2e6aff872d7477e6988c3a09097701a4779282ad7fe6f52d029bc95de32')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
