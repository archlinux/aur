# Maintainer: Sergey Shatunov <me@prok.pw>

_pkgname=Flask-OAuthlib
pkgname=python2-flask-oauthlib
pkgver=0.9.3
pkgrel=1
pkgdesc='Flask-OAuthlib is an extension to Flask that allows you to interact with remote OAuth enabled applications'
arch=(any)
url='https://github.com/lepture/flask-oauthlib'
license=('MIT')
depends=('python2' 'python2-oauthlib')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" )
md5sums=('5cf967e3f678a22aee8cb99ebc906c58')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
