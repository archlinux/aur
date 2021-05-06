# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=notify-send.sh
pkgver=1.2
pkgrel=1
pkgdesc="notify-send drop-in replacement with more features"
arch=('any')
url="https://github.com/vlevit/notify-send.sh"
license=('GPL3')
depends=('glib2')
source=("https://github.com/vlevit/$pkgname/archive/v"$pkgver".tar.gz")
md5sums=('874ccaea5a6875e28d1880173582f477')
sha256sums=('ae46aadcdaefc655c49c5cb432bede4e5bfcf406af0ba21df0ddcd17103944b1')

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 notify-send.sh "$pkgdir/usr/bin/notify-send.sh"
    install -Dm0755 notify-action.sh "$pkgdir/usr/bin/notify-action.sh"
}
