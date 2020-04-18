# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=notify-send.sh
pkgver=1.1
pkgrel=1
pkgdesc="notify-send drop-in replacement with more features"
arch=('any')
url="https://github.com/vlevit/notify-send.sh"
license=('GPL3')
depends=('glib2')
optdepends=('bc: --force-expire support')
source=("https://github.com/vlevit/$pkgname/archive/v"$pkgver".tar.gz")
md5sums=('b83ad1f86b7949f74d4e977dadaaff12')
sha256sums=('58460c5fc84ab4fa45d2de62a38e7d0a08af2c106327ce49a83a8dcbb91ba438')

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 notify-send.sh "$pkgdir/usr/bin/notify-send.sh"
    install -Dm0755 notify-action.sh "$pkgdir/usr/bin/notify-action.sh"
}
