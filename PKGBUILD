# Maintainer: tastyminerals <tastyminerals@gmail.com>
pkgname=multitran_er
pkgver=1.0
pkgrel=1
pkgdesc="Simple multitran.com console client"
arch=(any)
url="https://github.com/tastyminerals/multitran-er.git"
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
source=(https://github.com/tastyminerals/multitran-er/blob/master/multitran_er.py)
md5sums=(897f05b8b3d2c28133118084888de4dd)

package() {
  # python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 755 multitran_er.py ${pkgdir}/usr/bin/multitran_er
}

