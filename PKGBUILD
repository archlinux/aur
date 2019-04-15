# Maintainer: Jeff Cuevas-Koch <jeff at [lastname-no-dashes] dot com>

pkgname=gogitver-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="gogitver: semantic versioning through git history"
arch=('x86_64')
url="https://github.com/annymsMthd/gogitver"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/annymsMthd/gogitver/releases/download/${pkgver}/linux.tar.gz")
md5sums=('caa95ba39039d24bbd965c28aa2c3d78')


package() {
  install -Dm755 $srcdir/gogitver $pkgdir/usr/bin/gogitver
}
