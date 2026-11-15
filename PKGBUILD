# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a model you choose"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.6.1-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.1/crucible-server-0.6.1-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.6.1-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.6.1/crucible-server-0.6.1-linux-aarch64.tar.gz")
sha256sums_x86_64=('d02cddf7efe00ec5e9aa53f81f910fbb9be27c65df13072d0e1723c8b7711f53')
sha256sums_aarch64=('aefab63f463dae7995f4a631addab7523a812f2ad32cde3d1acab19736676536')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
