# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.2
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xclip bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '08b652cba462a263214b8dadd4739c82771bd319f00f718c03717be013592a2756b9f97698e47198704f51e9571f100fdb49af2a800b65b6109189a0f6f7f883'
  '3b16197cd8d00ddbe8693eaabf363c977943c89c35a1cd5bfc9d8f0253d9f4aa36e49dda52c83134bad6f0b5ca4414ea8c171403c2d8239c9adb38ad88572fd8'
  )
md5sums=(
  '778af676f56c01789ddd6b865452fa1c'
  'eeef294d5add166442d00943463cab9e'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
