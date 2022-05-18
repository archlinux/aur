# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=clipdl;
pkgver=1.1
pkgrel=1
pkgdesc="A simple script for downloading videos from links coppied to your primary clipboard"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(yt-dlp dunst xclip)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '3cbc786c1dc44389517786b05ca363a193aca9d3e113f6d61814112cd58448f3ad803c723727f739a679a2d2fb28fa1bb319e48e7fd5be395cda5544e3cb4748'
  '7e8c74d237e6a3fd95387f76a817249d3ed57b73904e611ded34933ea87c23ef1cdadcd6b68078514689e62e993c792cbf5892e00c4848bcb9de1e91d9bf07cf'
  )
md5sums=(
  'f495eef8d9cfda33306f8830fed10896'
  '01c5e4b91860f146865b0b4da4354df5'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

