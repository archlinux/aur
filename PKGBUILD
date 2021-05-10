# Maintainer: Felix Mujkanovic <hello@loadingbyte.com>
pkgname=cinecred
pkgver=1.0.0
pkgrel=1
pkgdesc="Create film credits---without pain"
arch=('x86_64')
url="https://loadingbyte.com/cinecred/"
license=('GPL3')
source=("https://repo.loadingbyte.com/repository/maven-public/com/loadingbyte/cinecred\
/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('4f9437859a5c64f7f0579cf8922342104c3215fb9e9262edc9b3b083fcce0382')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -R "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
}
