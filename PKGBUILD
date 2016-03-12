# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=r-vimcom
pkgver=1.3
pkgrel=1
pkgdesc='Intermediates communication between Vim and R'
url='https://github.com/jalvesaq/VimCom'
arch=('i686' 'x86_64')
license=('unknown')
depends=('r>=3.0.0')
source=("https://github.com/jalvesaq/VimCom/releases/download/v${pkgver//_/-}/${pkgname#r-}_${pkgver//_/-}.tar.gz")
sha256sums=('32bea76caec8ff44141b919bf8c9b630f1966a075e81430f22586fc1d014b686')

package() {
  mkdir -p ${pkgdir}/usr/lib/R/library
  R CMD INSTALL ${pkgname#r-} -l ${pkgdir}/usr/lib/R/library
}
