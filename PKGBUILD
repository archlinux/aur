# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jtool-bin
pkgver=2.0
pkgrel=3
pkgdesc='Enhanced object file displaying tool for Mach-O executables'
arch=('x86_64')
url='http://www.newosxbook.com/tools/jtool.html'
license=('unknown')
source=(${pkgname}-${pkgver}.tar.gz::'http://www.newosxbook.com/tools/jtool2.tgz')
b2sums=('f9d5391acafd26ddc4f84ea2e94af02c2268e6a383d832a3a2a6c973cabb8d6088e028dd58904057b551adad9d63fd3de1cb44353d4100dd6bab93bad56d6137')

package() {
  install -Dm755 "${srcdir}"/jtool2.ELF64 "${pkgdir}"/usr/bin/jtool
}
