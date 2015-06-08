# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=avahi4j
pkgver=0.1
pkgrel=1
pkgdesc="A simple Java API built on top of Avahi to browse & publish services"
url="https://code.google.com/p/avahi4j/"
arch=('any')
license=( "GPL3" )
depends=( "java-environment" )
makedepends=( "apache-ant" )
source=( "https://avahi4j.googlecode.com/files/$pkgname-$pkgver.tar.gz" )
sha1sums=('4feaea7c23afcb31a2890205dd0634e978b77bf6')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ant jar
  install -Dm644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname.jar
}
