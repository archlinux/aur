# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Spider.007 <archPackage@spider007.net>

pkgname=adobe-air
pkgver=2.6
pkgrel=1
license=('GPL')
arch=('any')
pkgdesc="Crossplatform desktop applications build using proven web technologies"
url="http://labs.adobe.com/technologies/air/"
source=('adobe-air')
depends=('adobe-air-sdk' 'unzip')

package() {
  install -Dm755 "$srcdir/adobe-air" "$pkgdir/usr/bin/adobe-air"
}

sha1sums=('87d2c0dcc288355200b431d4b8b595b690b8d075')
