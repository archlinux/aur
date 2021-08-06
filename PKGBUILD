# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.4
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools')
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("e3d3a5b1376a01f23256c90b959e6e8a")

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm755 "$srcdir/$pkgname/wgnord" "$pkgdir/usr/bin/wgnord"
}
