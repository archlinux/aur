# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=agate-dbf
pkgname=python-$_pkgname
pkgver=0.1.0
pkgrel=1
pkgdesc="Adds read support for dbf files to agate"
arch=('any')
url="http://agate-dbf.readthedocs.org/"
license=('MIT')
depends=('python'
         'python-nose'
         'python-tox'
         'python-sphinx'
         'python-sphinx_rtd_theme'
         'python-wheel'
         'python-dbfread'
         'python-agate')

source=("https://pypi.python.org/packages/c4/b2/94632d367b6db0dc03d95f171e38b621c85f49e55b7c33a55fd3032336d9/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('ffd9bfc7c04fc3ce1c54522f41aeccba5a7f3cee951b26c8a0ab1348c940ff77')

# vim:set ts=2 sw=2 et:
