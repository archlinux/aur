# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=r-vimcom
pkgver=1.2_8
pkgrel=1
pkgdesc='Intermediates communication between Vim and R'
url='https://github.com/jalvesaq/VimCom'
arch=('i686' 'x86_64')
license=('unknown')
depends=('r>=3.0.0')
source=("https://github.com/jalvesaq/VimCom/releases/download/v${pkgver//_/-}/${pkgname#r-}_${pkgver//_/-}.tar.gz")
sha256sums=('5fe1df1933a19dee13b5a3b1fb77d767510c0b56622f57b0f09c0fe6c07c26fc')

package() {
  mkdir -p ${pkgdir}/usr/lib/R/library
  R CMD INSTALL ${pkgname#r-} -l ${pkgdir}/usr/lib/R/library
}
