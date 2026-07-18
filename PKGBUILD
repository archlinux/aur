# Maintainer: hikari <me at metantesan dot com>
pkgname=kubit-cli-bin
pkgver=0.3.85
pkgrel=1
pkgdesc="CLI tool to interact with Pack and other Kubernetes resources"
arch=('x86_64')
url="https://kubit.cloud"
license=('custom:Proprietary')
provides=('kubit-cli')
conflicts=('kubit-cli')
options=('!strip')
source_x86_64=("https://kubit.cloud/download/kubit")
sha512sums_x86_64=('c4b45b52f39b52a2745334d50c2df5e1edba5bacbfdced6a6bd8b63974ad32b621a5c2ff68be8951cf0a6a51ecac298a3e4fd9104f1f3a839d8acc589d27d365')

package() {
	install -Dm755 "$srcdir/kubit" "$pkgdir/usr/bin/kubit"
}