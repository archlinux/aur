# Author : esclapion <esclapion[at]gmail[dot]com>

pkgname=ttf-droid-min
pkgver=1.0
pkgrel=1
pkgdesc="DroidSans, DroidSans-Bold,DroidSansMono"
url="http://www.droidfonts.com"
arch=('any')
license=('Apache')
depends=()
optdepends=()
source=()
md5sums=()
package() {
  dest=${pkgdir}/usr/share/fonts/TTF
  mkdir -p $dest   
  cd $dest
  curl -# http://esclapion.free.fr/AUR/ttf-droid-min.tar.gz | tar xzf -
}
