# Maintainer: Sébastien Leduc <seblu@aur.archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python2-twitter
_srcname=python-twitter
pkgver=3.3
pkgrel=1
pkgdesc='Python 2 wrapper around the Twitter API'
arch=('any')
url='https://pypi.python.org/pypi/python-twitter'
license=('APACHE')
depends=('python2' 'python2-httplib2' 'python2-simplejson' 'python2-oauth2' 'python2-requests-oauthlib')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/b6/43/3e91acc643b9e11430dc1288dcac33c88aca6c417272a961729fd04c2ed8/${_srcname}-${pkgver}.tar.gz")
md5sums=('f07f2519c779cb6f6ba85bd98d2ee09e')

package() {
  cd $_srcname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 ft=sh et:
