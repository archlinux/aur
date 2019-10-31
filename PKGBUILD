# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jtool-bin
pkgver=1.0
pkgrel=1
pkgdesc='Enhanced object file displaying tool for Mach-O executables'
arch=('x86_64')
url='http://www.newosxbook.com/tools/jtool.html'
license=('unknown')
source=(http://www.newosxbook.com/tools/jtool.tar)
sha512sums=('51d4f8a8b2712b1fa0bc5c7ab1b6ce1a0dda5d581f604326691eeed0516acef7601c7ef8ad8a81067178ec26eace679a93676700ed8a51b5a5c51caa4eb34a20')

package() {
  install -Dm755 "${srcdir}"/jtool.ELF64 "${pkgdir}"/usr/bin/jtool
  install -Dm644 "${srcdir}"/jtool.1 "${pkgdir}"/usr/share/man/man1/jtool.1
}
