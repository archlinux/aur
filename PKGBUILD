# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.4.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.4.0/crucible-server-0.4.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.4.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.4.0/crucible-server-0.4.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('184951ba7d9a6a48e4d5c22f446b59a649a07b9df698b1f3fe3d13cef3fdfad5')
sha256sums_aarch64=('996a8186dc5db2a1934068cecc188d08f9501c28c52fff2d56ce6f7d492d5270')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
