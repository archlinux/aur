# Maintainer: Maya Pasricha <maya.pasricha _ nyu _ edu>
pkgname=nier-cursors-bin
pkgver=2020_08_25
pkgrel=1
pkgdesc="XCursor theme based on NieR Automata"
arch=('any')
url="https://github.com/Beinsezii/NieR-Cursors"
license=('MIT')
# You can thank Yoko Taro's decision to stylise NieR with capital letters for
# hardcoding this instead of using $pkgname
source=(
  "$url/releases/download/${pkgver//_/-}/NieR_Cursors_${pkgver//_/-}.tar.xz"
  "LICENSE"
)

package() {
  install -Ddm755 "${pkgdir}"/usr/share/icons/"${pkgname}"
  cp -R --no-preserve=ownership "${srcdir}"/nier_cursors/* "${pkgdir}"/usr/share/icons/"${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
md5sums=('9406690176de9cbd10c92a971fa022b8'
  '5f33aa2e6130ccc29c0a86a1ff6be222')
