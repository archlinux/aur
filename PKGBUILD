# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jtool-bin
pkgver=2.0
pkgrel=1
pkgdesc='Enhanced object file displaying tool for Mach-O executables'
arch=('x86_64')
url='http://www.newosxbook.com/tools/jtool.html'
license=('unknown')
source=(${pkgname}-${pkgver}.tar.gz::'http://www.newosxbook.com/tools/jtool2.tgz')
b2sums=('80c739375f8bd2ca9323295ddadae30a413e881ea0c6eaaf49cde7c809701e6d385db2ea8c92fb1ed1cd685fb301996f4b7d7f1d7760590930852474f8295ccf')

package() {
  install -Dm755 "${srcdir}"/jtool2.ELF64 "${pkgdir}"/usr/bin/jtool
}
