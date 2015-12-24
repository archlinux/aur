# Maintainer: tastyminerals <tastyminerals@gmail.com>
pkgname=mtran
pkgver=1.0
pkgrel=1
pkgdesc="Simple multitran.com console client"
arch=(any)
url="https://github.com/tastyminerals/mtran.git"
license=('MIT')
groups=()
depends=('python>=3.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://raw.githubusercontent.com/tastyminerals/multitran-er/master/mtran.py)
md5sums=(47bf5d8e432a25d88bf4bb1ddd5ce671)

package() {
  # python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 755 mtran.py ${pkgdir}/usr/bin/mtran
}

