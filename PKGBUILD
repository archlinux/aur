# Maintainer: Felix Mujkanovic <hello@loadingbyte.com>
pkgname=cinecred
pkgver=1.2.0
pkgrel=1
pkgdesc="Create film credits---without pain"
arch=('x86_64')
url="https://loadingbyte.com/cinecred/"
license=('GPL3')
source=("https://repo.loadingbyte.com/repository/maven-public/com/loadingbyte/cinecred\
/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('524dbbf94d0a31f02b0bb36ee98685618987a43ef72c26942ab5e6ea7066bc33')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -R "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
}
