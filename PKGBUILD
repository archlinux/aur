# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL')
source=("https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('e2296700b8101fb91e554290e31ddcb1c2f9e2e5f33d31533b8f6bbb68c4e3ba')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64" "$pkgdir/usr/bin/talosctl"
}
