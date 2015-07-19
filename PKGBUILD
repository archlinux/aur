# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=gitbucket
pkgver=3.4
pkgrel=1
pkgdesc="The easily installable Github clone written with Scala"
url="https://github.com/takezoe/gitbucket"
arch=( 'any' )
license=( "Apache" )
depends=( "java-runtime"  )
makedepends=( )
source=( "$pkgname-$pkgver.war::https://github.com/takezoe/gitbucket/releases/download/$pkgver/gitbucket.war"
         "$pkgname.service" )
sha1sums=('408bb666a32873addf79cbc2153acac09e4f8403'
          'c93c600608d7922f67f4a3036a944fefc48bf9e0')

package() {
  install -Dm644 "$srcdir"/$pkgname-$pkgver.war "$pkgdir"/usr/share/java/$pkgname.war
  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
