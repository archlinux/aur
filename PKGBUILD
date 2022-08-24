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
  'c44c676ea993cb0633f78d9e322d15d680bbabd8e7c580448c4ea7509958a71ed8ea07ac9d5fba043d6bcb5b85187142572656946f5cc2dd57751a0b3e4774ac'
  '21eded23d70d73ece3e97c21135ec2f3bca04f6c9d6723f6ca55b1d5e6021a035b9b00831c37746456aa4b8cb1bcdb75286d20099adb52cccc001cd0b26098e5'
  )
md5sums=(
  '402d7dba8fe8b19a7b9960259705ddf0'
  'bcb16043d4a3b36b6922f12f9ad60dbf'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
