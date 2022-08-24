# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.2
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
  '16e2332263be81425ec9873990aedf26308678ec042c24d4f299377d4797984b974145ef886a3a158546144dbb2d0f0962eece62983cc6431ad30a5a9aa99183'
  '6eb66f5fd7f6910b66c51a0ad9d9b9f321d9cb77e78d4b9d9e738b7d39b7df59cd0aac282787c9a74e0421d363c8d685104136833a192d9cbda55389e367ba35'
  )
md5sums=(
  'e3c58b54bdee526e9279edfc479a9088'
  '14a015370fb4a8ca0fef4530f9b950f2'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
