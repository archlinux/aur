# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=streamlink-ttvlol
_pkgver=8.2.1-20260305
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Streamlink Twitch plugin modified to work with the TTV.LOL API."
arch=('any')
url="https://github.com/2bc4/streamlink-ttvlol"
license=('BSD-2-Clause')
depends=('streamlink')
source=("$pkgname-$_pkgver.py::$url/releases/download/$_pkgver/twitch.py")
sha256sums=('f38cb99755a819216d34963efbc274c0fa82479215c4ba194bd79773762cab4e')
install="${pkgname}.install"

package() {
    install -Dm644 "$srcdir/$pkgname-$_pkgver.py" "$pkgdir/usr/share/$pkgname/twitch.py"
}
