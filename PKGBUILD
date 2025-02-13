# Maintainer: baboon

pkgname="speed-dreams-data"
pkgver=2.4.0
pkgrel=1
pkgdesc="Base assets for Speed Dreams"
arch=('x86_64')
url="https://speed-dreams.net/"
license=('GPL3')
depends=()
conflicts=('speed-dreams-svn' 'speed-dreams-git')
source=("https://files.speed-dreams.net/public/b61bbdbca2d5c17bb9150049117dbc77")
sha512sums=('SKIP')
options=('!strip')

package() {
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.gz"
}
