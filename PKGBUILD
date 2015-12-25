# Maintainer: tastyminerals <tastyminerals@gmail.com>
pkgname=line_up
pkgver=1.0
pkgrel=1
pkgdesc="Refit and justify all lines in a text file to some arbitrary width"
arch=(any)
url="https://github.com/tastyminerals/line_up.git"
license=('MIT')
groups=()
depends=('python>=2.7')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://raw.githubusercontent.com/tastyminerals/line_up/master/line_up.py)
md5sums=(6fc99dd350380bbf22066ed7527acae7)

package() {
  # python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 755 line_up.py ${pkgdir}/usr/bin/line_up
}

