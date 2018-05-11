# Maintainer: Alexandre Moine <alexandre@moine.me>
# Contributor: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.5.2
pkgrel=1
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2')
depends=('python2' 'python2-setuptools' 'python2-httplib2' 'python2-polib' 'python2-lxml')
source=("https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('1a06fda3befeecf572b9a5d2348f36be1e27daf5326bb0312c7f50ebf6f5eb24')

#Tests needs python-mock, not packaged yet

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
