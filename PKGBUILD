# Maintainer: Ranieri Althoff <@domain.com>
pkgname=wpa-psk
pkgver=0.1.0
pkgrel=1
pkgdesc='Generate a WPA PSK from an ASCII passphrase for a SSID'
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('python')
source=("$pkgname.py")
sha256sums=('8dddd39534c9c48574222bef1d81efbb34992a6143a786f07c051d58904b1fff')

package() {
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
