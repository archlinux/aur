# Maintainer: Ranieri Althoff <@domain.com>
pkgname=wpa-psk
pkgver=0.3.0
pkgrel=1
pkgdesc='Generate a WPA PSK from an ASCII passphrase for a SSID'
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('python')
source=("$pkgname.py")
sha256sums=('706e15e85519e6013beb66895ec9f1e18e0c09319a7fc1d34a8b196c927e7e9a')

package() {
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
