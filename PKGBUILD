# Maintainer: Sébastien Leduc <seblu@aur.archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python2-twitter
_srcname=python-twitter
pkgver=3.2.1
pkgrel=1
pkgdesc='Python 2 wrapper around the Twitter API'
arch=('any')
url='https://pypi.python.org/pypi/python-twitter'
license=('APACHE')
depends=('python2' 'python2-httplib2' 'python2-simplejson' 'python2-oauth2' 'python2-requests-oauthlib')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/p/${_srcname}/${_srcname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/39/44/4ff06d3f0ab9f8ee718f7f74bd1bdbc257da157e00c78a5f8901cb384629/${_srcname}-${pkgver}.tar.gz#md5=9d7430bc5b1ef924be7830a4806d645a")
md5sums=('9d7430bc5b1ef924be7830a4806d645a')

package() {
  cd $_srcname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 ft=sh et:
