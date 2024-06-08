# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=ghidra-desktop
pkgver=2
pkgrel=1
pkgdesc='Software reverse engineering framework (desktop icon)'
arch=('x86_64')
url='https://ghidra-sre.org/'
license=('Apache')
depends=('ghidra')
source=(ghidra.desktop
        ghidra.png)
sha512sums=('ba82c4c8c4cd29181429591c5c57c1ac23e1aa620a7d605738c831d55bb1790796e2ddd69c7aac60620f11192e29dab1d36745535eb4c1fc623d72236e3c5258'
            '94790784d8fa6803ccae02d7b3b93e37dc37328870512180401dcc48eafde70898217ece584e24442c8e4806ac25e32d4606cf950c9fc736425ad4da96c6b2ee')

package() {
  install -Dm 644 "${srcdir}"/ghidra.png -t "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 "${srcdir}"/ghidra.desktop -t "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
