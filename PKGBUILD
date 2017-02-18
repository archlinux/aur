# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=notify-send.sh
pkgver=0.2
pkgrel=1
pkgdesc="notify-send drop-in replacement with more features"
arch=('any')
url="https://github.com/vlevit/notify-send.sh"
license=('GPL3')
depends=('glib2')
source=("https://github.com/vlevit/$pkgname/archive/v"$pkgver".tar.gz")
md5sums=('8d1473fad15e7ec9cae8d048af4d1f8b')

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
