# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-cliapp
pkgver=1.20160724
pkgrel=1
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url="http://liw.fi/cliapp/"
license=('GPL2')
depends=('python2' 'python2-yaml')
source=("http://code.liw.fi/debian/pool/main/p/python-cliapp/python-cliapp_$pkgver.orig.tar.xz")
sha256sums=('bce2375523e7721e8ef5e5c85ac72554f5c2acc5136dc528fcbce877e217c2b6')

build() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
