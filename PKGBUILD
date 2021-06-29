# Maintainer: Felix Mujkanovic <hello@loadingbyte.com>
pkgname=cinecred
pkgver=1.1.0
pkgrel=1
pkgdesc="Create film credits---without pain"
arch=('x86_64')
url="https://loadingbyte.com/cinecred/"
license=('GPL3')
source=("https://repo.loadingbyte.com/repository/maven-public/com/loadingbyte/cinecred\
/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('34b087c619cb8e092128b9c43796841b31aeb167d39c53dc8098710120f6ab2b')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -R "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
}
