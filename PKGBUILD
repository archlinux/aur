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
  '6e6b59128d22bbcd26f00d203286b6a5942985fcea16a2ec8d16901e395b26ab9d8a2520e7d1371563f00b11cd501131f698c3297f3927df99950331b8e46b32'
  '6103b1ba6d76cd324b6c25c00838a8cfc847d4c36e0170a47b56da94138f5d3a5050653b073278fc8e1b880fbfa34f63b7c29620a283ac61853983084e42c018'
  )
md5sums=(
  '79fdbf13adbf0af41b9714b8aa9a8f9f'
  '1d4ede612d182bef01ea177538e7f5c8'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

