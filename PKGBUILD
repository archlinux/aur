# Maintainer: Jeff Cuevas-Koch <jeff at [lastname-no-dashes] dot com>

pkgname=gogitver-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="gogitver: semantic versioning through git history"
arch=('x86_64')
url="https://github.com/annymsMthd/gogitver"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/annymsMthd/gogitver/releases/download/${pkgver}/linux.tar.gz")
md5sums=('465bd7ec82a334e25b7a3f657ef93026')


package() {
  install -Dm755 $srcdir/gogitver $pkgdir/usr/bin/gogitver
}
