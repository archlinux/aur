# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname='python-spam-blocklists'
pkgver=0.9.3
pkgrel=1
pkgdesc='Provides programatic access to spam blocklists'
arch=('any')
url='https://pypi.python.org/pypi/spam-blocklists/0.9.3'
license=('LGPL')
depends=()
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/e1/96/e2151b454cc286afae4db3ef0bc45f64409654a86356b449920abe9bccf2/spam-blocklists-${pkgver}.tar.gz")
md5sums=('426f6d63186cd977afd9cc2f75b2bd9f')

build() {

  cd "${srcdir}/spam-blocklists-${pkgver}"
  python ./setup.py build

}

package() {

  cd "${srcdir}/spam-blocklists-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
