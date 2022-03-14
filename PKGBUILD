# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=pkgdl
pkgver=1.0.r4
pkgrel=1
pkgdesc='Seamlessly download multiple packages simultaneously from various sources'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(paru)
makedepends=()                 
optdepends=(
  'npm: To download node packages'
  'snapd: To install snap packages'
  'flatpak: To install flatpak packages'
  )
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  'aec250c4d357ac70e5fd408104f581c562947fef4caa422c32c06ec87621e4cf'
  '4c8dfa9bdf9267ad5d5173f1df709e63999095624a644a5cfc1b56b4ffe1adae'
  )

package() {
  install -Dm775 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 usr/share/doc/${pkgname}/README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
