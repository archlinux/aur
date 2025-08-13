# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=bitsnpicas
pkgver=2.1
pkgrel=2
pkgdesc='Bitmap and Emoji Font Creation and Conversion Tools.'
arch=('any')
url="https://github.com/kreativekorp/bitsnpicas"
license=('MPL')
depends=('java-runtime')
source=(
  "https://github.com/kreativekorp/$pkgname/releases/download/v$pkgver/BitsNPicas.jar"
  "https://github.com/kreativekorp/$pkgname/releases/download/v$pkgver/KeyEdit.jar"
  "https://github.com/kreativekorp/$pkgname/releases/download/v$pkgver/MapEdit.jar"
  "bitsnpicas.sh"
  "bitsnpicas-keyedit.sh"
  "bitsnpicas-mapedit.sh"
  "bitsnpicas.desktop"
  "bitsnpicas-keyedit.desktop"
  "bitsnpicas-mapedit.desktop"
)
sha256sums=(
  'b34e0d4e85c402dc0035d24a67b489f15cc301677d512c721074ee3204da8547'
  'd928da2448071f8045473bbc42a0e127e45af7e28f813f5ffa4376da92da1d58'
  'e1005dc8e8a6c11ae1eeba0cc1d2b7494f04b61ad94fbebef1bef5a2558f8e4a'
  '71eede1d61dde3ffb75013b2bbf48614eb6b50658d64167a30005b230438275d'
  'ae9c42ce205bf88af198d61a0e9ebbe752acfe349a1c2953e0a22902452fdc9d'
  '4173cb8389eeca4733ee4c2f89ecaebbe9aa59e440bb17feef9800ace6fc59f9'
  '3699a8ee4947aeaa37a32f0ee1465ae6820b802971c1a87e3ecef8234939a49c'
  '4b9e10a294bced9bd28e84fb02ba5e85ebe82118050e59ffe857b1854773c441'
  'cab7e1337a8990d8cf02520d04dbd64777310f0e633d72cf920e591d953b7704'
)

package() {
  install -D -m755 -T "${srcdir}/bitsnpicas.sh" "${pkgdir}/usr/bin/bitsnpicas"
  install -D -m755 -T "${srcdir}/bitsnpicas-keyedit.sh" "${pkgdir}/usr/bin/bitsnpicas-keyedit"
  install -D -m755 -T "${srcdir}/bitsnpicas-mapedit.sh" "${pkgdir}/usr/bin/bitsnpicas-mapedit"
  install -D -m644 -T "${srcdir}/BitsNPicas.jar" "${pkgdir}/usr/share/bitsnpicas/BitsNPicas.jar"
  install -D -m644 -T "${srcdir}/KeyEdit.jar" "${pkgdir}/usr/share/bitsnpicas/KeyEdit.jar"
  install -D -m644 -T "${srcdir}/MapEdit.jar" "${pkgdir}/usr/share/bitsnpicas/MapEdit.jar"
  install -D -m644 -T "${srcdir}/bitsnpicas.desktop" "${pkgdir}/usr/share/applications/bitsnpicas.desktop"
  install -D -m644 -T "${srcdir}/bitsnpicas-keyedit.desktop" "${pkgdir}/usr/share/applications/bitsnpicas-keyedit.desktop"
  install -D -m644 -T "${srcdir}/bitsnpicas-mapedit.desktop" "${pkgdir}/usr/share/applications/bitsnpicas-mapedit.desktop"
}
