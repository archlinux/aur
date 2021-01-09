# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jtool-bin
pkgver=2.0
pkgrel=2
pkgdesc='Enhanced object file displaying tool for Mach-O executables'
arch=('x86_64')
url='http://www.newosxbook.com/tools/jtool.html'
license=('unknown')
source=(${pkgname}-${pkgver}.tar.gz::'http://www.newosxbook.com/tools/jtool2.tgz')
b2sums=('f1673377b3a845607747a05c0f058343b62e63ad42a63b533ac74cfa5523d2295579c21cf30737e7a6a1a69fcdde1d802267301de41b6d221d9b0d016e92be93')

package() {
  install -Dm755 "${srcdir}"/jtool2.ELF64 "${pkgdir}"/usr/bin/jtool
}
