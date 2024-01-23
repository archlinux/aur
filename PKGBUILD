# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL')
source=("https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('e61249bf9488e779182ea67864838e530053084b2f20481565a26c62220be5d1')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64" "$pkgdir/usr/bin/talosctl"
}
