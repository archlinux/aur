# Maintainer: Neil Romig <neilromig at gmail dot com>

pkgname=courier-pythonfilter
pkgver=3.0.6
pkgrel=1
pkgdesc="pythonfilter is a collection of useful filters for the Courier MTA, and a framework for developing new filters in Python."
arch=(any)
url="https://pypi.org/project/courier-pythonfilter"
license=('GPL')
groups=()
depends=('python3' 'courier-mta')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/pythonfilter.conf' 'etc/pythonfilter-modules.conf')
options=()
install=courier-pythonfilter.install
source=(https://files.pythonhosted.org/packages/93/4b/371ec18dc58addc13cc689197b2d4e2b204d11b4f5ea66e7603b9d65c28b/courier-pythonfilter-3.0.6.tar.gz
        courier-pythonfilter.install)
sha1sums=('f9f2ff52144fe13b51969585ad2897c48d094e8a'
          '678bd5e4a3da90e267d359cbe04572cf976c6a07')

package() {
  cd "$srcdir/courier-pythonfilter-3.0.6"

  python3 setup.py install --root="$pkgdir/"
}
