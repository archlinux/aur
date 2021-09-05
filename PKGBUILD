# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.6
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'sed' 'grep')
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("0d00850a59c03e96b8beac8f92c1acc5")

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm755 "$srcdir/$pkgname/wgnord" "$pkgdir/usr/bin/wgnord"
}
