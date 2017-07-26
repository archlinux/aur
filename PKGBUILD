# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-flask-ask
pkgname=('python-flask-ask' 'python2-flask-ask')
pkgver=0.8.8
pkgrel=1
pkgdesc="Rapid Alexa Skills Kit Development for Amazon Echo Devices in Python."
arch=('any')
url='https://github.com/johnwheeler/flask-ask'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/johnwheeler/flask-ask/archive/v${pkgver}.tar.gz")
sha256sums=('f718ca5c58055654b7a74889f29de2c5efc2a10c2b866eee14c2f87e8e6fd13c')

package_python-flask-ask() {
  depends=('python-aniso8601' 'python-flask' 'python-pyopenssl' 'python-yaml' 'python-six')
  pkgdesc="Rapid Alexa Skills Kit Development for Amazon Echo Devices in Python. (python3 version)"

  cd "${srcdir}/flask-ask-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-flask-ask() {
  depends=('python2-aniso8601' 'python2-flask' 'python2-pyopenssl' 'python2-yaml' 'python2-six')
  pkgdesc="Rapid Alexa Skills Kit Development for Amazon Echo Devices in Python. (python2 version)"

  cd "${srcdir}/flask-ask-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
