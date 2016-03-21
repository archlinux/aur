# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=r-vimcom
pkgver=1.3_1
pkgrel=1
pkgdesc='Intermediates communication between Vim and R'
url='https://github.com/jalvesaq/VimCom'
arch=('i686' 'x86_64')
license=('unknown')
depends=('r>=3.0.0')
source=("https://github.com/jalvesaq/VimCom/releases/download/v${pkgver//_/-}/${pkgname#r-}_${pkgver//_/-}.tar.gz")
sha256sums=('86900fe664d30af1ca98012827437351c9cec0118e18ef7972249d68b5ad2eb3')

package() {
  mkdir -p ${pkgdir}/usr/lib/R/library
  R CMD INSTALL ${pkgname#r-} -l ${pkgdir}/usr/lib/R/library
}
