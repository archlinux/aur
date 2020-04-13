pkgname=obmenu3
pkgver=1.05
pkgrel=1
pkgdesc="Openbox menu editor - replacement of obmenu"
url="http://sourceforge.net/projects/obmenu3"
license=('GPL')
depends=('gtk2')
arch=('i686' 'x86_64')
source=(http://sourceforge.net/projects/obmenu3/files/$pkgver/obmenu3-$pkgver-$CARCH.tgz)
if [[ $CARCH == 'i686' ]]; then
  md5sums=('3a1c6160857822956ed4b4dfb69dfcc6')
else
  md5sums=('27bdece52c221e7a10c5e30ce7e06850')
fi
package() {
  cp -R "$srcdir/usr" "$pkgdir"
}
