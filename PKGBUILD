# Maintainer: Neil Romig <neilromig at gmail dot com>

pkgname=courier-pythonfilter
pkgver=3.0.3
pkgrel=2
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
source=(https://bitbucket.org/gordonmessmer/courier-pythonfilter/get/fdf2f466e757.zip)
sha1sums=('c885c66ce0e5876873da6575419d116ca1d7bdda')

package() {
  cd "$srcdir/gordonmessmer-courier-pythonfilter-fdf2f466e757"

  python3 setup.py install --root="$pkgdir/"
}
