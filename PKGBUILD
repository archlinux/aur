# Maintainer: baboon

pkgname="speed-dreams-data-bin"
pkgver=2.4.2
pkgrel=1
pkgdesc="Base assets for Speed Dreams"
arch=('x86_64')
url="https://speed-dreams.net/"
license=('GPL3')
depends=()
conflicts=('speed-dreams-svn' 'speed-dreams-git' 'speed-dreams-data')
provides=('speed-dreams-data')
source=("https://files.speed-dreams.net/public/796b5cc8e16a970f595b1b23c9e9dc2b")
sha512sums=('SKIP')
options=('!strip')

package() {
  cd $pkgdir
  tar xf "$srcdir/data.tar.gz"
}
