# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=notify-send.sh
pkgver=0.1
pkgrel=1
pkgdesc="notify-send drop-in replacement with more features"
arch=('any')
url="https://github.com/vlevit/notify-send.sh"
license=('GPL3')
depends=('glib2')
source=("https://github.com/vlevit/$pkgname/archive/v"$pkgver".tar.gz")
md5sums=('ef6c220d4863ff2e54ec60d1f6428c7e')

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
