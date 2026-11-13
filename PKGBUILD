# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.3.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.3.0/crucible-server-0.3.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.3.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.3.0/crucible-server-0.3.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('6272404ae260018a39801771cd05020434c1ff325d51b400706569ebe83ded98')
sha256sums_aarch64=('4713ab4dbeae6a59f1b3db3265ee324ca9d0c81642cbd27254894f9df16eb8c2')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
