# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=clipdl
pkgver=1.3
pkgrel=1
pkgdesc="A simple script for downloading videos from linkss coppied to your primary clipboard"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(yt-dlp dunst xclip)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '453a5d98145e566dbb927dba2647f5812d8167a28d82ae38a205c6a81851503b84d8ddd541605c84c8e3a6c23ac63f3ca41deb66ea1610f7a4617cbb103163e5'
  'b204ae8c87833eee04f0fff4f02e54c092adab62e7d86dc1197ca8b4108bff0c8bf7496b766cf6b650d17c1a7df372fce0850281fcf44f09daa78ae36ff92bb1'
  )
md5sums=(
  'f6470275f5fda1d6773798397b6fb85e'
  'ce39016555f6a414b8bf6f980e5e0040'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

