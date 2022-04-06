# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-flask-ask
pkgver=0.8.8
pkgrel=1
pkgdesc="Rapid Alexa Skills Kit Development for Amazon Echo Devices in Python."
arch=('any')
url='https://github.com/johnwheeler/flask-ask'
license=('Apache')
depends=('python-aniso8601' 'python-flask' 'python-pyopenssl' 'python-yaml' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/johnwheeler/flask-ask/archive/v${pkgver}.tar.gz")
sha256sums=('f718ca5c58055654b7a74889f29de2c5efc2a10c2b866eee14c2f87e8e6fd13c')

package() {
  cd "${srcdir}/flask-ask-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
