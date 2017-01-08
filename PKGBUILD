# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=0.12.2
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python' 'python-distribute' 'python-urllib3')
source=("https://pypi.io/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5e157041c5d0063ef337d7fa89007ecd611ca5e20fb5abdb3228ff80a0aea8c1')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
