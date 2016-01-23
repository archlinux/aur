# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=python2-instapaperlib
pkgver=0.5.1
pkgrel=1
pkgdesc='Python library for the instapaper.com API'
arch=('any')
url='https://pypi.python.org/pypi/instapaperlib'
license=('GPL')
depends=('python2')
source=(https://pypi.python.org/packages/source/i/instapaperlib/instapaperlib-${pkgver}.tar.gz)
md5sums=('e87cb6a522217490953209904a671125')
sha256sums=('1ca460cc41b978d5217cad149dec4227ed0793fa5a5c1217400206bd8601513c')

package() {
  cd "instapaperlib-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
