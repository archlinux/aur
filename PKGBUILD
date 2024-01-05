# Maintainer: Neil Romig <neilromig at gmail dot com>

pkgname=courier-pythonfilter
pkgver=3.0.4
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
source=(https://files.pythonhosted.org/packages/05/d1/219cf53af0cb4e0cacfcbb43b53c6660d59de7adbe72be79de607ffe1b3e/courier-pythonfilter-3.0.4.tar.gz
        courier-pythonfilter.install)
sha1sums=('0236621cea68af13097fa9aec3d87f700e53d2f9'
          '678bd5e4a3da90e267d359cbe04572cf976c6a07')

package() {
  cd "$srcdir/courier-pythonfilter-3.0.4"

  python3 setup.py install --root="$pkgdir/"
}
