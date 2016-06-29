# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=confd
pkgver=0.11.0
pkgrel=1
pkgdesc="A lightweight configuration management tool"
arch=(x86_64)
url="https://github.com/kelseyhightower/confd"
license=('MIT')
source=("https://github.com/kelseyhightower/$pkgname/releases/download/v$pkgver/confd-$pkgver-linux-amd64"
 "https://raw.githubusercontent.com/kelseyhightower/$pkgname/master/LICENSE")
md5sums=('e026e6807fbda9c1aba7bb068b22d8e4'
         'a7c77d088bc8e2c497cf2cce6f20292f')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  install -m755 "confd-$pkgver-linux-amd64" $pkgdir/usr/bin/$pkgname
  install -TDm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
