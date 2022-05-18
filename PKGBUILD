# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=clipdl
pkgver=1.2
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
  '8fab18834876e0a0a3344707d1c7c56f0f98e54542334d027e1002aafddf92ff94325b53c3f107bebc336ba7aaba24d35b477124127ead3b1ae757ab1022beff'
  '4d4d3cb3674516a6dfb6e703b6909139d9655454c385e7b18972eabb1d98240445cbda72ab1dad1028f7032d685d23db455b4dde7b75c05ef8ee7e9c20aaee5f'
  )
md5sums=(
  '600f548232610bd593ede1d0e8758b75'
  'dba4c4a8b4373c0ee850910c5469fbf8'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

