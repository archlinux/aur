# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=repoup
pkgver=0.1.0
pkgrel=1
pkgdesc="A git repository updater and manager"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '8db27268e46e58c116f6e2e206ab1c036e319728be3d7de18430c30f23e6a5070f8fde3e8d86ab50fbe31b93f10769288a34afbadbb9fb4e95c48e556a280532'
  '8daf50a34037f5da0821268a2358f296ed60f20b7fa78498e9159f40d06b090c120644a15f7eae238f5b2e0f391296e042c77679ec2820345cd02abc6d478e7a'
  )
md5sums=(
  'e5026fdf5ace56561b29299e4558a345'
  '4239275babec0a77172cda54ff5de042'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
