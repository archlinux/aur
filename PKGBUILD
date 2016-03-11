# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=r-vimcom
pkgver=1.2_9
pkgrel=1
pkgdesc='Intermediates communication between Vim and R'
url='https://github.com/jalvesaq/VimCom'
arch=('i686' 'x86_64')
license=('unknown')
depends=('r>=3.0.0')
source=("https://github.com/jalvesaq/VimCom/releases/download/v${pkgver//_/-}/${pkgname#r-}_${pkgver//_/-}.tar.gz")
sha256sums=('730590a35399b2343b9e7c7f24b0820be344719d3509c391869adb7aa10d8790')

package() {
  mkdir -p ${pkgdir}/usr/lib/R/library
  R CMD INSTALL ${pkgname#r-} -l ${pkgdir}/usr/lib/R/library
}
