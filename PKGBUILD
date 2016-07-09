# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=0.12.1
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python' 'python-distribute' 'python-urllib3')
source=("https://pypi.io/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('86809d10e0cfff4b4d81fa852d11064fe89fc7add5b6f09fec3950497efdf02d')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
