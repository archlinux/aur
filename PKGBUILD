# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=dungeon-revealer-bin
pkgver=1.6.1
pkgrel=1
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
         '8faeb01b83c9a84ad192560807f161c8'
         '45d5e0f2dea06d1fc4e187e5584c9473')

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
