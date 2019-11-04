# Maintainer: Popolon <popolon@popolon.org>
pkgname=ibus-table-mongol-bichig
pkgver=git
pkgrel=2
pkgdesc='https://framagit.org/popolon/ibus-table-mongol_bichig'
arch=(any)
url='https://framagit.org/popolon/ibus-table-mongol_bichig'
license=('WTFPL')
depends=('ibus-table')
optdepends=('noto-fonts: contains mongolian script')
makedepends=('ibus-table')
source=("git+https://framagit.org/popolon/ibus-table-mongol_bichig.git")
sha256sums=(SKIP)

build() {
  cd ibus-table-mongol_bichig

 ./compile.sh
}

package() {
  cd ibus-table-mongol_bichig

  install -Dm644 mongol_bichig.db "${pkgdir}/usr/share/ibus-table/tables/mongol_bichig.db"
  install -Dm644 mongol_bichig.svg "${pkgdir}/usr/share/ibus-table/icons/mongol_bichig.svg"
}
