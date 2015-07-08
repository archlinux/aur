# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=openstego
pkgver=0.6.1
pkgrel=1
pkgdesc="Plugin based tool for steganography, with encrytion support."
arch=('i686' 'x86_64')
url="http://openstego.sourceforge.net"
license=('GPL2')
depends=('java-environment' 'java-runtime' 'x-server')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.zip $pkgname.sh)
md5sums=('86879a53207c78b0c2443df2538b4cf3'
         '1208162b85c214fcc9c7b43e29dd604b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 lib/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -D -m644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
