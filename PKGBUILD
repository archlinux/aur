# Maintainer: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.3.22
pkgrel=1
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2')
depends=('python2' 'python2-setuptools' 'python2-httplib2' 'python2-polib')
source=("https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('8129d9841e056288f8ea195ad7fa40a9f262a7b10234bcf6457980a65c4259be')

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}


