# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=jackrabbit
pkgver=2.12.1
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha1sums=('e88cd71f50cc35cd4091b29086401ab0ba69462b')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
