# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=bitsnpicas
pkgver=2.0.2
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
  'c09148a3637af9193708eba1e90670d1de4844d135f6fdbbdc547b317785e93b'
  '71eede1d61dde3ffb75013b2bbf48614eb6b50658d64167a30005b230438275d'
  '8219dae573acdc5939657d0d8dcaf818ae59b5bc8c5e1d6de17670b18fd0c3b9'
)

package() {
  install -D -m755 -T "${srcdir}/bitsnpicas.sh" "${pkgdir}/usr/bin/bitsnpicas"
  install -D -m644 -T "${srcdir}/BitsNPicas.jar" "${pkgdir}/usr/share/bitsnpicas/BitsNPicas.jar"
  install -D -m644 -T "${srcdir}/bitsnpicas.desktop" "${pkgdir}/usr/share/applications/bitsnpicas.desktop"
}
