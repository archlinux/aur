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
  '9961d2cd9621c3652b7733c8a17213bb4eff4c5d5a6c1bf9181da93456c9ccee6c8542784077d2c3b9ab91ce6e479855711f664e2e143c1c680a96914a518083'
  '8fd3b7f50aeb4cdb6cda8ae2986fd0635ba5fb40135e456606c0044feb2bac48691118b2f85200b6c889ea0df4e4bd87c4fc80c7a49d9356bca74337d32e5d49'
  )
md5sums=(
  '9c574a38bd8d519f2524f7cfefc16662'
  'cb84d38d8c3f83fc9dd4f8a88c1d9675'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}                                              

