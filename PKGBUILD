# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=crucible-server-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Companion to Plex for Crucible: skips, Previously On and answers from a local model"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Crucible/tree/master/server"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('crucible-server')
conflicts=('crucible-server')
source_x86_64=("crucible-server-0.1.0-linux-x86_64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.1.0/crucible-server-0.1.0-linux-x86_64.tar.gz")
source_aarch64=("crucible-server-0.1.0-linux-aarch64.tar.gz::https://github.com/guitaripod/Crucible/releases/download/server-v0.1.0/crucible-server-0.1.0-linux-aarch64.tar.gz")
sha256sums_x86_64=('441f85fe71979075395f193dec8ead7144ca743ef41937ab848b44c4303cdc2f')
sha256sums_aarch64=('3e800cc60f83a8abd09765e2b1cc524dbe1871075b91bd61d36718c840d8bd0d')

package() {
    install -Dm755 crucible-server "$pkgdir/usr/bin/crucible-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/crucible-server/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
