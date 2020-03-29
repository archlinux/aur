# Maintainer: Ellis_Cake <ellis_cake at outlook dot com>
pkgname=earnom
pkgver=0.1
pkgrel=1
pkgdesc="A KISS search-and-play from youtube gui script using playx"
arch=('any')
url="https://github.com/EllisCake/EarNom/"
license=('GPL3')
depends=('yad' 'playx')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

package() {
  cd "$pkgname"
  install -Dm755 earnom "$pkgdir/usr/bin/earnom"
  echo "earnom is placed in /usr/bin"
  echo "Start with command: earnom"
}

