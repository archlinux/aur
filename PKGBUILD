# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-cliapp
pkgver=1.20150701
pkgrel=1
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url="http://liw.fi/cliapp/"
license=('GPL2')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-cliapp/python-cliapp_$pkgver.orig.tar.xz")
sha256sums=('6410f7593cfd871efec4bb1a544ffca016a97554b7361fadae827d3068f5406f')

build() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/python-cliapp-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
