# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.3
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools')
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("8d1b436e4ea917d9feb6b9356b5652c0")

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm755 "$srcdir/$pkgname/wgnord" "$pkgdir/usr/bin/wgnord"
}
