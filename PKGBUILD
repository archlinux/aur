# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=randomcase-git
pkgver=0.5
pkgrel=3
pkgdesc="Converts input to case from SpongeBob meme"
arch=('any')
license=('MIT')
url="https://git.auteiy.me/dmitry/randomCase"
depends=('python')
source=(https://git.auteiy.me/dmitry/randomCase/raw/v0.5/randomcase)
md5sums=('644ac74ce08e5acdd54e25cd5bcf7bd4')

package() {
  cd $srcdir

  install -d $pkgdir/usr/bin/
  install -Dm755 $srcdir/randomcase $pkgdir/usr/bin
}
