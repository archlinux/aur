# Maintainer: lostmason <lostmason@tutamail.com>
pkgname=ttf-pragmasevka-nerd-font
_pkgmajor=1
_pkgminor=7
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Pragmata Pro doppelgänger made of Iosevka SS08"
arch=('any')
url="https://github.com/shytikov/pragmasevka"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shytikov/pragmasevka/releases/download/v${pkgver}/Pragmasevka_NF.zip")
b2sums=('a182fbc626c5bc2ed55684072d8d2c2b3acf41f5f1754a69b34599c610a2af344a656d74ca631facf1da901dc95568bcd3d1816613a3abafe4f71a4ce39fbee7')

package() {
  # Create font directory
  install -d ${pkgdir}/usr/share/fonts/TTF/

  # Install all TTF variants
  install -m644 "${srcdir}"/pragmasevka-nf-*.ttf ${pkgdir}/usr/share/fonts/TTF
}
