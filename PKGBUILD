# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=shsysusers
pkgver=1
pkgrel=1
pkgdesc="A replacement for systemd-sysusers written in bash "
arch=('any')
url="https://github.com/42LoCo42/shsysusers"
license=('GPL')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('4ec4ef90e8f003abbd63dfb369ef4e9acd6c9cadc89f143044b1420a00596a18')
