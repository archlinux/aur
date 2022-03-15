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
  '08a10b07ce1e17b244da755b903420b21b022fed33661c0551050315ac82399d'
  '85efc65905f51fe77f3052d6a5582c0b5ff716846fd4330d144a0a8adf070350'
  )

package() {
  install -Dm775 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 usr/share/doc/${pkgname}/README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

