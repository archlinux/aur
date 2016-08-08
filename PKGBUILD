# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-cliapp
pkgver=1.20160109
pkgrel=2
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url="http://liw.fi/cliapp/"
license=('GPL2')
depends=('python2' 'python2-yaml')
source=("http://code.liw.fi/debian/pool/main/p/python-cliapp/python-cliapp_$pkgver.orig.tar.xz")
sha256sums=('7f75501ed3a930d00fc344eaee7cda3e6ba38161a95d75fb315facf8e9a6a028')

build() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
