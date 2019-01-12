# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=notify-send.sh
pkgver=1.0
pkgrel=1
pkgdesc="notify-send drop-in replacement with more features"
arch=('any')
url="https://github.com/vlevit/notify-send.sh"
license=('GPL3')
depends=('glib2')
source=("https://github.com/vlevit/$pkgname/archive/v"$pkgver".tar.gz")
md5sums=('341e6712086b4843b44d663528dcc68a')
sha256sums=('ec06365be9d66b2a2ec57f1867529a20c6b56f40c8c0379eb9af95eebb006b6b')

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 notify-send.sh "$pkgdir/usr/bin/notify-send.sh"
    install -Dm0755 notify-action.sh "$pkgdir/usr/bin/notify-action.sh"
}
