# Maintainer: phire <me@phire.cc>
pkgname=mlvd
pkgver=0.1
pkgrel=1
pkgdesc="A Mullvad Wireguard client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/mlvd"
depends=('jq' 'curl' 'wireguard-tools')
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("6e889e0695570459c16590573b3d4251")

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm755 "$srcdir/$pkgname/mlvd" "$pkgdir/usr/bin/mlvd"
}
