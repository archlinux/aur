# Maintainer: zacoons <zac@zacoons.com>

pkgname=dnss-bin
pkgver=0.1.0
pkgrel=0
pkgdesc="A small, speedy DNS proxy and bad-stuff-blocker."
arch=("x86_64" "armv7h" "aarch64")
url="https://codeberg.org/zacoons/dnss"
license=("Unlicense")
provides=("dnss")
backup=("etc/dnss.conf")

source_x86_64=("https://codeberg.org/zacoons/dnss/releases/download/${pkgver}/dnss-${pkgver}-x86_64-linux.tar.gz")
source_armv7h=("https://codeberg.org/zacoons/dnss/releases/download/${pkgver}/dnss-${pkgver}-armv7h-linux.tar.gz")
source_aarch64=("https://codeberg.org/zacoons/dnss/releases/download/${pkgver}/dnss-${pkgver}-aarch64-linux.tar.gz")

b2sums_x86_64=("SKIP")
b2sums_armv7h=("SKIP")
b2sums_aarch64=("SKIP")

package() {
	cd "$srcdir"
	install -Dm 755 "dnss" "$pkgdir/usr/bin/dnss"
}
