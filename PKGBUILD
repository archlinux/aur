# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=randomcase-git
pkgver=0.2
pkgrel=1
pkgdesc="Converts input to case from SpongeBob meme"
arch=('any')
license=('MIT')
url="https://git.auteiy.me/dmitry/randomCase"
depends=('python')
source=(https://git.auteiy.me/dmitry/randomCase/raw/v0.2/randomcase)
md5sums=('fa7172f4a9f1284b0631c8d79302a3ab')

package() {
  cd $srcdir

  install -d $pkgdir/usr/bin/
  install -Dm755 $srcdir/randomcase $pkgdir/usr/bin
}
