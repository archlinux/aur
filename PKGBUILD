# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.5.4-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.5.4/crucible-server-0.5.4-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.5.4-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.5.4/crucible-server-0.5.4-linux-aarch64.tar.gz")
sha256sums_x86_64=('0dd945ab21dec7f577582f3cee580f46ec4ce3a1fab205185d6d30a7b915f6cf')
sha256sums_aarch64=('924c5eca8e222358aa450d854a3bd0705e5b9d970930e7fb2d86d5460f8d3378')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
