# Maintainer: Ensar Sarajčić <es.enar at gmail dot com>
#
pkgname="fbihtax"
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
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/esensar/$pkgname/releases/download/$pkgver/$pkgname-linux.zip"
        "https://raw.githubusercontent.com/esensar/$pkgname/$pkgver/LICENSE")
noextract=()
sha256sums=('6ed1ae73cbe32022e5be9ddd4689e9177891de69fcccb9ea4b07e66dc682179f'
            '5ed063358afdef13866ed90f97205d89ff3747869a6c737f5b618e73773404fb')
validpgpkeys=()

package() {
	install -Dm0775 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
