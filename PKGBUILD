# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=langid
pkgname=python2-langid
pkgver=1.1.6
pkgrel=1
pkgdesc="A standalone Language Identification (LangID) tool"
arch=('any')
url="https://github.com/saffsd/langid.py"
license=('BSD')
depends=('python2' 'python2-numpy')
source=("https://pypi.python.org/packages/ea/4c/0fb7d900d3b0b9c8703be316fbddffecdab23c64e1b46c7a83561d78bd43/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('044bcae1912dab85c33d8e98f2811b8f4ff1213e5e9a9e9510137b84da2cb293')

# vim:set ts=2 sw=2 et:
