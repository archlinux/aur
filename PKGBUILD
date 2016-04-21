# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-ssoclient
pkgname=('python-ssoclient' 'python2-ssoclient')
pkgname=python-ssoclient
pkgver=2.1.1
pkgrel=1
pkgdesc="ssoclient"
arch=(any)
url="https://pypi.python.org/pypi/ssoclient"
license=('AGPL')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/ssoclient/ssoclient-${pkgver}.tar.gz")
sha256sums=('d468a616604d2c0c45f94e81ae882d5892fa8a726ec207e8768a6ecde57fe3d7')

package_python2-ssoclient() {
  depends=('python2-requests-oauthlib' 'python2-requests')
  pkgdesc="ssoclient. (python2 version)"
  
  cd "${srcdir}/ssoclient-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-ssoclient() {
  depends=('python-requests-oauthlib' 'python-requests')
  pkgdesc="ssoclient. (python3 version)"

  cd "${srcdir}/ssoclient-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
