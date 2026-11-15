# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.6.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.0/crucible-server-0.6.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.6.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.0/crucible-server-0.6.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('533748f077df9a0e9842c1843cabd060fdc87b9498ca815140b8f0a4190281da')
sha256sums_aarch64=('cd4caf531922c3494fa09e50904d1934f0690b1cee65eafd2e138ef3541fabf8')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
