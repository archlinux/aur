# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.8.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.8.0/crucible-server-0.8.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.8.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.8.0/crucible-server-0.8.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('fbb6b74602595bfb8e7e0f9f46dae4c3e1250ea2d2da4f05a666eba4a115f732')
sha256sums_aarch64=('77f77ead2b3568cd1bf19919b16b2017de0f74453fb2539739acbdcd8d78d810')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
