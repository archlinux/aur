# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=talosctl-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL')
source=("https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('80a9e324564eeb448b228b7345cfb523a156d6362f994d7a557ca0ae353552e7')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64" "$pkgdir/usr/bin/talosctl"
}
