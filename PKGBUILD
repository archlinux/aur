# Maintainer: Lukas K. <lu at 0x83 dot eu>

_libname=webcolors
pkgname=python-$_libname
pkgver=1.5
pkgrel=1
pkgdesc=" Library for working with HTML/CSS color formats in Python"
arch=("any")
url="http://blockdiag.com/en/seqdiag/index.html"
license=('bsd')
depends=('python')
source=("https://github.com/ubernostrum/$_libname/archive/$pkgver.tar.gz")
md5sums=("02f5985cd0600090b3afdecd649abccc")

package() {
  cd "$srcdir/$_libname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
