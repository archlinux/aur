# Maintainer: zacoons <zac@zacoons.com>

pkgname=clipward-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland clipboard ward."
arch=(x86_64)
url=https://codeberg.org/zacoons/clipward
license=(Unlicense)
depends=(glibc wayland)
provides=(clipward)

source_x86_64=("https://codeberg.org/zacoons/clipward/releases/download/$pkgver/clipward-linux-amd64.tar.gz")

b2sums_x86_64=(de512a3b4bb66ab60f12e35a26652c5e5ef39ed37e71f2c84ff153d96cd0a85c03ee005dee8934c3f20f2c0ad0e3cf6045c0a0406028a8a46db01698543e51fc)

package() {
	cd "$srcdir"
	install -Dm 755 clipward "$pkgdir/usr/bin/clipward"
}
