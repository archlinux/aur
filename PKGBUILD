# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.1
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '67c86e7b91bbb3813f2d38adb545de8286b334202a9f6876e4806a8c40cbf02928a946ae584271864fc69ec6350d749bf15347db38b24fc3fd4aa47444186ada'
  '891a2f734f19bb4f9fbc7081eccc475ecea9bb68813ee252920b13142b0d765cc701300cb9c1a777d94aad2303369cbbdf64c54f4ca79815090078b195a2f96a'
  )
md5sums=(
  '757cff600d50e6c6c70823a76dc1c46d'
  'b15de2c9fafb0b152d4f76eb7047c49c'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
