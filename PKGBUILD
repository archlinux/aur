# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Francois Boulogne < fboulogne at april dot org >

pkgname=pdfjumbler
pkgver=0.4.0
pkgrel=1
epoch=1
pkgdesc="A simple tool to rearrange/merge/delete pages from PDF files"
arch=('any')
url="https://github.com/mgropp/pdfjumbler"
license=('GPL3')
depends=('java-runtime>=11')
source=("$pkgname-$pkgver.jar::$url/releases/download/v$pkgver/$pkgname.jar"
        "$pkgname.sh")
sha256sums=('551b29996f6e4e4aeedf8b9cf18ef42dcdd467948b7e6a72cd5711a619efd18d'
            'fc703e692a41163f92247a45564519e1b27685ff7928bbdd9ebd4264f2698615')

package() {
	install -Dm755 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
