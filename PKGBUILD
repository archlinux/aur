# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=ghidra-desktop
pkgver=1
pkgrel=1
pkgdesc='Software reverse engineering framework (desktop icon)'
arch=('x86_64')
url='https://ghidra-sre.org/'
license=('Apache')
depends=('ghidra')
source=(ghidra.desktop
        ghidra.png)
sha512sums=('d0af73f4d671a10e7318c780b545b86844c75a5cd374ce94136db393815d8233b798417ca786a9012a8033ab448e1df4e8806d7c3b8f6bae19de4a327ee1217d'
            '94790784d8fa6803ccae02d7b3b93e37dc37328870512180401dcc48eafde70898217ece584e24442c8e4806ac25e32d4606cf950c9fc736425ad4da96c6b2ee')

package() {
  install -Dm 644 "${srcdir}"/ghidra.png -t "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 "${srcdir}"/ghidra.desktop -t "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
