# Maintainer: Microwave Tank <microwave@particlecannon.org>

pkgname=goose-bin
pkgver=3.21.1
pkgrel=1
pkgdesc='Goose is a database migration tool. Manage your database schema by creating incremental SQL changes or Go functions.'
arch=('x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
source=("https://github.com/pressly/goose/releases/download/v$pkgver/goose_linux_x86_64")
sha256sums=('5773946fdc67e6255379d6031d16d9ef0501608ab2a7bbbb9938ae6a2bc7251c')

package() {
	install -Dm755 "goose_linux_x86_64" "${pkgdir}/usr/bin/goose"
}
