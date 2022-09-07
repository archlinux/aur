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
  '26de48aac9bfa5f6181864cfbb79656c0a35e0765fd4ed0aa4027b3a41fb28df5c32a7380ea55907985e4c3c4e7549dcbf95bcccad9f0376b062ec62dcb9f139'
  '242f9bd28d72db32518c68878732651f07d37c7cbd7341390bddba66cacea0228334d651d470c2a3908df918216409f2df4b0ce65e6af510203e504a67cfe1dc'
  )
md5sums=(
  '60eec0c3f91a6fce5faac5eb5fbcb51f'
  '7389cc8345891bb7829baaa4f7279f2f'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
