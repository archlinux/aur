# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL')
source=("https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('99540b1d3bbc4d7bd41e8dfd5027941bed5eb29eff09756aed513b41e391eac9')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64" "$pkgdir/usr/bin/talosctl"
}
