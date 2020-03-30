# Maintainer: Ellis_Cake <ellis_cake at outlook dot com>
pkgname=earnom
pkgver=0.1
pkgrel=2
pkgdesc="A KISS search-and-play from youtube gui script using playx"
arch=('any')
url="https://github.com/EllisCake/EarNom/"
license=('GPL3')
depends=('yad' 'playx' 'python-numpy' 'python-selenium' 'python-beautifulsoup4' 'python-requests')
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

