# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=jackrabbit
pkgver=2.12.2
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha1sums=('c50be440cb18baafc94f14b50434bec4f17ccac8')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
