# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.1
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog fzf)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '5d320cea2d5ab961db771035a50d3672e3b598d882abf894d08c91b1bd0fb305a20dc834e43b62c6ef98a91e2beca8e77dd7e403e668bdbbed2f569604498c5a'
  '7c804fbce60e6e34005f5abce8b5d634b82343f965ddcffd0ed399201f0d70548a76c7a222ae853fece3ceffc36a5355e0fe1beec1a2df7174b3cf6943df5d5e'
  )
md5sums=(
  'e286cc04b7945317ed5decac5dcf4ec2'
  '1001887da1a667895a6f8ab52a606a63'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
