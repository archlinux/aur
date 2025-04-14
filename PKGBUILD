# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Maintainer: Mahdi Mirzadeh <mahdi@mirzadeh.pro>

pkgname=eitaa-bin
pkgver=4.3.3
pkgrel=2
license=('Custom')
pkgdesc="Official Desktop version of Eitaa messaging app - Static binaries"
depends=()
makedepends=()
provides=('Eitaa')
arch=('x86_64')
url="https://eitaa.com"
source=(
  "Eitaa-linux-$pkgver.tar.xz::https://eitaa.com/app/desktop/linux"
  "com.eitaa.desktop"
  "eitaa.svg"
)

sha256sums=(
  '7e6920381c385758e6de1a49157a600c0c71d12b370eeb338389a3a946802eb4'
  '6bf04092a60ef81317d53258ea9def8a096d6e066ef8922ed9233c2e91a5d93a'
  '9bbf5bb323260eefdd85082ef45a2174252601ae910bd3b26f7f0b3c1bfa6e14'
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./Eitaa
  install -Dm644 -t "${pkgdir}/usr/share/icons" \
      ./eitaa.svg
  install -Dm644 -t "${pkgdir}/usr/share/applications" \
      ./com.eitaa.desktop
}
