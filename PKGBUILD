pkgname=rmtrash
pkgver=1.12
pkgrel=1
pkgdesc='trash-put made compatible to GNUs rm and rmdir'
arch=('i686' 'x86_64')
url='https://github.com/PhrozenByte/rmtrash'
license=('GPL')
depends=('trash-cli')
install=rmtrash.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhrozenByte/rmtrash/archive/v$pkgver.tar.gz"
        'PKGBUILD.sig')
sha256sums=('23a39883c2706a105ba291b3eaf0d10119f40aedfd58abe2b302ec2c97280353'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D rmtrash "$pkgdir/usr/bin/rmtrash"
  install -D rmdirtrash "$pkgdir/usr/bin/rmdirtrash"
}
