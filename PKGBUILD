# Maintainer: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.4.2
pkgrel=1
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2')
depends=('python2' 'python2-setuptools' 'python2-httplib2' 'python2-polib')
source=("https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('474e003466f0bd9855efe902d25fc2d5eedb3aeb28cb23365984220dbffea4d6')

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}


