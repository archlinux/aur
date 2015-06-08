# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
pkgname=xbmcswift
pkgver=1.3.1
pkgrel=1
pkgdesc="A micro framework to enable rapid development of XBMC plugins."
arch=('any')
url="http://www.xbmcswift.com/en/latest/quickstart.html#"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=(https://github.com/jbeluch/xbmcswift2/archive/xbmc-$pkgver.tar.gz)
md5sums=('24a8511242d9e0132f35bb95407d549d')

package() {
  cd "$srcdir/xbmcswift2-xbmc-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
