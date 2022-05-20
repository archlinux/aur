# Maintainer: Ensar Sarajčić <es.enar at gmail dot com>
#
pkgname="fbihtax-bin"
pkgver="0.3.0"
pkgrel=1
epoch=
pkgdesc="CLI tool to help manage tax payments in FBiH (Bosnia and Herzegovina Federation) written in Rust."
arch=('x86_64')
url="https://github.com/esensar/fbihtax"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=("pdftk: PDF output support")
provides=('fbihtax')
conflicts=('fbihtax')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/esensar/fbihtax/releases/download/$pkgver/fbihtax-linux.zip"
        "https://raw.githubusercontent.com/esensar/fbihtax/$pkgver/LICENSE")
noextract=()
sha256sums=('6ed1ae73cbe32022e5be9ddd4689e9177891de69fcccb9ea4b07e66dc682179f'
            '5ed063358afdef13866ed90f97205d89ff3747869a6c737f5b618e73773404fb')
validpgpkeys=()

package() {
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/fbihtax/LICENSE"
	install -Dm775 "$srcdir/fbihtax" "$pkgdir/usr/bin/fbihtax"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
