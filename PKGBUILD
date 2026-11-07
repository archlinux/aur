# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=streamlink-ttvlol
_pkgver=8.3.0-20260701
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Streamlink Twitch plugin modified to work with the TTV.LOL API."
arch=('any')
url="https://github.com/2bc4/streamlink-ttvlol"
license=('BSD-2-Clause')
depends=('streamlink')
source=("$pkgname-$_pkgver.py::$url/releases/download/$_pkgver/twitch.py")
sha256sums=('4d465380159ec59f7caef6cb6a28368bbbbd3abcf80886138182184c30f2fad0')
install="${pkgname}.install"

package() {
    install -Dm644 "$srcdir/$pkgname-$_pkgver.py" "$pkgdir/usr/share/$pkgname/twitch.py"
}
