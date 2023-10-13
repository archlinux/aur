# Maintainer: Filip Parag <filip@parag.rs>

pkgname=translitrs-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Transliteration utility for Serbian language'
arch=('x86_64')
url='https://github.com/filiparag/translitRS'
license=('MIT')
optdepends=('pandoc')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/translitrs-${pkgver}-gnu_linux-x86_64"
)
sha256sums=(
    '79f370acc1c2b0f18ab0e734a3addfbc369b8c663dbb087f5ba2e7d4909216be'
    '0fa152d0b28adb0d0dfeea9a70c171138c4df3c9967c884053a9ef085a59fb05'
)

package() {
  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/translitrs"
  install -Dm 644 "./translitRS-${pkgver}/README.md" "${pkgdir}/usr/share/doc/translitrs/README.md"
}
