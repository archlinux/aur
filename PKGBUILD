# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Christopher Heien <chris.h.heien@gmail.com>

pkgname=openid4java
pkgver=0.9.8.741
pkgrel=2
pkgdesc="OpenID 2.0 Java Libraries"
arch=('i686' 'x86_64')
url="http://code.google.com/p/openid4java/"
license=('Apache 2')
depends=('java-runtime')
makedepends=( 'apache-ant' )
source=( http://openid4java.googlecode.com/files/$pkgname-$pkgver.tar.gz )
sha1sums=('e418c816c60a1e6b8646cc76e15da2107553e5bc')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ant
  install -Dm 0755 build/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname.jar
}
