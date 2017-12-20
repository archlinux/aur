# Maintainer: Alexandre Moine <alexandre@moine.me>
# Contributor: TingPing <tingping@tingping.se>

pkgname=zanata-python-client
pkgver=1.5.1
pkgrel=2
pkgdesc='Client for managaging translations on Zanata'
arch=('any')
url='http://zanata.org/'
license=('LGPL2')
depends=('python2' 'python2-setuptools' 'python2-httplib2' 'python2-polib' 'python2-lxml')
source=("https://github.com/zanata/zanata-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('0016359a5a376b00e61b702b25aa47a7aeb5dd0dfff270952db006746adeb38a')

#Tests needs python-mock, not packaged yet

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
