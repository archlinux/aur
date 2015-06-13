# Maintainer: Sébastien Leduc <seblu@aur.archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python2-twitter
_srcname=python-twitter
pkgver=2.2
pkgrel=1
pkgdesc='Python 2 wrapper around the Twitter API'
arch=('any')
url='https://pypi.python.org/pypi/python-twitter'
license=('APACHE')
depends=('python2' 'python2-httplib2' 'python2-simplejson' 'python2-oauth2' 'python2-requests-oauthlib')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/p/${_srcname}/${_srcname}-${pkgver}.tar.gz")
md5sums=('eab697b3a9bc6bf3432d09a489f4ed8b')

package() {
  cd $_srcname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 ft=sh et:
