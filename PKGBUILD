# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.6.3-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.3/crucible-server-0.6.3-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.6.3-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.3/crucible-server-0.6.3-linux-aarch64.tar.gz")
sha256sums_x86_64=('9b8a0dcb460f826fee75d5aeb7395e68facbd3ca5172d80483a99735d180143c')
sha256sums_aarch64=('7281a6c3c92fcda24c4a3eefc8524c04344698a3a568ace905092867cb8cfade')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
