# Maintainer: Ranieri Althoff <@domain.com>
pkgname=wpa-psk
pkgver=0.2.0
pkgrel=1
pkgdesc='Generate a WPA PSK from an ASCII passphrase for a SSID'
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('python')
source=("$pkgname.py")
sha256sums=('61e387b8af78d4aad16c2b8727008982e987a694e31c4f3814ef422e045f4b09')

package() {
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
