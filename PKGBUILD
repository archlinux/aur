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
  '2fff387d9d1615884d7dac8889a5b4c3974b86397a6e95d37f3345e9fcb663540ccce4e7526218a2f5d215a8e05ac801be1fb29b198b9dd093d6f7c77828e6d6'
  '8dd81857b8b75257e4ac3bcd57aef0784afb545433a7cd5619a2baa27e0f58737dc6757f4cf9bf048c5ba1e363f602357723400c4b438bf969240897e9c656d8'
  )
md5sums=(
  '4c4c17fef28bd1455389018f44315518'
  'f58503e3500fefe3b772349702085f58'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

