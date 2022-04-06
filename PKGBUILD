# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-ssoclient
pkgver=2.1.1
pkgrel=2
pkgdesc="ssoclient"
arch=(any)
url="https://pypi.python.org/pypi/ssoclient"
license=('AGPL')
depends=('python-requests-oauthlib' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/ssoclient/ssoclient-${pkgver}.tar.gz")
sha256sums=('d468a616604d2c0c45f94e81ae882d5892fa8a726ec207e8768a6ecde57fe3d7')

package() {
  cd "${srcdir}/ssoclient-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
