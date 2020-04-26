# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jtool-bin
pkgver=1.0
pkgrel=1
pkgdesc='Enhanced object file displaying tool for Mach-O executables'
arch=('x86_64')
url='http://www.newosxbook.com/tools/jtool.html'
license=('unknown')
source=('http://www.newosxbook.com/tools/jtool.tar')
b2sums=('1f3960b6272e38b46d1329327367f4cd08c780195048f74992546b373031177c4b3e4268925b5f566a0e4bf2e84f4b9b353945e5c6ce6e9d951f6cfc3908feda')

package() {
  install -Dm755 "${srcdir}"/jtool.ELF64 "${pkgdir}"/usr/bin/jtool
  install -Dm644 "${srcdir}"/jtool.1 "${pkgdir}"/usr/share/man/man1/jtool.1
}
