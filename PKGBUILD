# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.0
pkgrel=1
pkgdesc="Easily set variables and their respective values for easy access at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xclip bat)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '789fc7fd9aaef186f51f809b84e8598f0a8cc9048281613beea739d32f6f2dbcacf62beade9d75ce40f15a0054c24176984fd487f4a483f49e77d769b19735d1'
  '83bb15acfadaa3e1c9dadf44ac5bac8c1ea18c221cd4086f388546005487040ba86690c65245ab86997bdd54a86b18e7497f5edee9ad2abcb2ac3749ed71dbf2'
  )
md5sums=(
  'e5cd8bf40417bfb4140bbf9fa467cea1'
  '26ac20441e284df0b549ed8c5366162d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
