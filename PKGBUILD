# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a local model"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.2.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.2.0/crucible-server-0.2.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.2.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.2.0/crucible-server-0.2.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('d574c687c8f983250fe4f72d679d7ff0e227379d3dc84cedfdf2f1de4725b504')
sha256sums_aarch64=('f8e16b39bed1a5d15a484f094d3f5998349582f89521235f99b244f54781d961')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
