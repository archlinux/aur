# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=randomcase-git
pkgver=0.3
pkgrel=1
pkgdesc="Converts input to case from SpongeBob meme"
arch=('any')
license=('MIT')
url="https://git.auteiy.me/dmitry/randomCase"
depends=('python')
source=(https://git.auteiy.me/dmitry/randomCase/raw/v0.3/randomcase)
md5sums=('f5653fa91dcb27e3762be0683f10d70c')

package() {
  cd $srcdir

  install -d $pkgdir/usr/bin/
  install -Dm755 $srcdir/randomcase $pkgdir/usr/bin
}
