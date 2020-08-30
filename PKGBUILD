# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Christopher Heien <chris.h.heien@gmail.com>

pkgname=openid4java
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenID 2.0 Java Libraries"
arch=('i686' 'x86_64')
url="https://github.com/jbufu/openid4java"
license=('Apache 2')
depends=('java-runtime')
makedepends=( 'ant' )
source=( https://github.com/jbufu/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz )
sha1sums=('50b8419f1024e97d294d569622ccf848350c7b4b')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ant
  install -Dm 0755 build/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname.jar
}
