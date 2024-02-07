# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL')
source=("https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('9346ae645f8dbcf1d63601c1dbf725d9e0475b225a9c483de872912fb9d87a01')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64" "$pkgdir/usr/bin/talosctl"
}
