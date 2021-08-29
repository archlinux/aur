# Maintainer: Neil Romig <neilromig at gmail dot com>

pkgname=courier-pythonfilter
pkgver=3.0.3
pkgrel=3
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
source=(https://bitbucket.org/gordonmessmer/courier-pythonfilter/get/fdf2f466e757.zip
        courier-pythonfilter.install)
sha1sums=('c885c66ce0e5876873da6575419d116ca1d7bdda'
          '678bd5e4a3da90e267d359cbe04572cf976c6a07')

package() {
  cd "$srcdir/gordonmessmer-courier-pythonfilter-fdf2f466e757"

  python3 setup.py install --root="$pkgdir/"
}
