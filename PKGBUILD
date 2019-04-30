# Maintainer: Jeff Cuevas-Koch <jeff at [lastname-no-dashes] dot com>

pkgname=gogitver-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="gogitver: semantic versioning through git history"
arch=('x86_64')
url="https://github.com/annymsMthd/gogitver"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/annymsMthd/gogitver/releases/download/${pkgver}/linux.tar.gz")
md5sums=('6afad3e0fa1fdbc48c586860505200f4')


package() {
  install -Dm755 $srcdir/gogitver $pkgdir/usr/bin/gogitver
}
