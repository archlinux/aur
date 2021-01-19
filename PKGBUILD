# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=isfree
pkgver=0.9.0
pkgrel=2
pkgdesc="Check your Arch system for nonfree software"
arch=(any)
url="https://github.com/leo-arch/isfree"
license=(GPL2)
depends=('pacman' 'sed' 'tar')
optdepends=('bc: percentages support')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/isfree/archive/v${pkgver}.tar.gz")
#sha256sums=('a6a381ce807bce3ec56609bf67f2a37486b00cd4f7b809500c890e28cfd39c35')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
