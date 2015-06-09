# Maintainer: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.3.21
pkgrel=2
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2')
depends=('python2' 'python2-setuptools' 'python2-httplib2' 'python2-polib')
source=("https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('a2f36b6a48492ad4196f09dc2fc6e0773fbc30aef0e08c941b5632546a6f68fd')

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}


