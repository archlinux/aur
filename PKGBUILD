# Maintainer: Jim Heald <james.r.heald@gmail.com>

pkgname=python-flask-oauthlib
pkgver=0.9.3
pkgrel=1
pkgdesc='Flask-OAuthlib is an extension to Flask that allows you to interact with remote OAuth enabled applications'
arch=(any)
url='https://github.com/lepture/flask-oauthlib'
license=('MIT')
depends=('python' 'python-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/lepture/flask-oauthlib/archive/v${pkgver}.tar.gz")
md5sums=('39cf06a3c1ab5550b8e8521604b2b102')

build() {
  cd ${srcdir}/flask-oauthlib-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/flask-oauthlib-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
