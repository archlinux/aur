# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=bitsnpicas
pkgver=2.0
pkgrel=1
pkgdesc='Bitmap and Emoji Font Creation and Conversion Tools.'
arch=('any')
url="https://github.com/kreativekorp/bitsnpicas"
license=('MPL')
depends=('jre-openjdk')
source=(
  "https://github.com/kreativekorp/$pkgname/releases/download/v$pkgver/BitsNPicas.jar"
  "bitsnpicas.sh"
  "bitsnpicas.desktop"
)
sha256sums=(
  '0b3a5a1dcd7641a80bda8edd4f6f63d6a5f09c804e0ef8a69903273ad24dcdee'
  '71eede1d61dde3ffb75013b2bbf48614eb6b50658d64167a30005b230438275d'
  '8219dae573acdc5939657d0d8dcaf818ae59b5bc8c5e1d6de17670b18fd0c3b9'
)

package() {
  install -D -m755 -T "${srcdir}/bitsnpicas.sh" "${pkgdir}/usr/bin/bitsnpicas"
  install -D -m644 -T "${srcdir}/BitsNPicas.jar" "${pkgdir}/usr/share/bitsnpicas/BitsNPicas.jar"
  install -D -m644 -T "${srcdir}/bitsnpicas.desktop" "${pkgdir}/usr/share/applications/bitsnpicas.desktop"
}
