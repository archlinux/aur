# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=spongebob
pkgver=0.0.1
pkgrel=1
pkgdesc="Converts input to case from SpongeBob meme"
arch=('any')
license=('MIT')
url="https://git.auteiy.me/dmitry/spongebob"
depends=('python')
source=(https://git.auteiy.me/dmitry/spongebob/raw/master/spongebob)
md5sums=('fa7172f4a9f1284b0631c8d79302a3ab')

package() {
  cd $srcdir

  install -d $pkgdir/usr/bin/
  install -Dm755 $srcdir/spongebob $pkgdir/usr/bin
}
