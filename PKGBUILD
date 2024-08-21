# Maintainer: lostmason <lostmason@tutamail.com>
pkgname=ttf-pragmasevka-nerd-font
_pkgmajor=1
_pkgminor=6
_pkgpatch=6
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Pragmata Pro doppelgänger made of Iosevka SS08"
arch=('any')
url="https://github.com/shytikov/pragmasevka"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shytikov/pragmasevka/releases/download/v${pkgver}/Pragmasevka_NF.zip")
b2sums=('95395d5ec431ae4900fe99c875ab27e57608bea626f8e4cc5451edf8985aa37082f3ed4a0d514a87eabd5d47e9d219479a030611232279ca45a9ec7bb6addf77')

package() {
  # Create font directory
  install -d ${pkgdir}/usr/share/fonts/TTF/

  # Install all TTF variants
  install -m644 "${srcdir}"/pragmasevka-nf-*.ttf ${pkgdir}/usr/share/fonts/TTF
}
