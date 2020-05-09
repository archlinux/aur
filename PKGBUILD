# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=dungeon-revealer-bin
pkgver=1.6.1
pkgrel=3
pkgdesc="Web app for tabletop gaming to allow the DM to reveal areas of the game map to players"
arch=('x86_64')
url="https://github.com/dungeon-revealer/dungeon-revealer"
license=('ISC')
depends=('sh')
makedepends=()
optdepends=()
options=('!strip')
install=
source=(
  "https://github.com/dungeon-revealer/dungeon-revealer/releases/download/v${pkgver}/dungeon-revealer-linux-v${pkgver}.zip"
  "dungeon-revealer.sh"
  "LICENSE"
)
md5sums=('a157735a55f18d44da8ea5ab96f967f3'
         '9e53291b0540605e26640cc3b1c3ffe7'
         '6c22ecd94b9533c537b70ec0982c5975')

prepare() {
	:
}

build() {
	:
}

package() {
	install -Dm755 "${srcdir}/dungeon-revealer-linux" "$pkgdir/usr/bin/dungeon-revealer-internal"
	install -Dm755 "${srcdir}/dungeon-revealer.sh" "$pkgdir/usr/bin/dungeon-revealer"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
