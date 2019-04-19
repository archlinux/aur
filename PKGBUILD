# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=plumed-patches
pkgver=0.1.0
pkgrel=1
pkgdesc="Additional patches for PLUMED"
url="http://www.plumed.org/"
license=('GPL')
arch=(any)
depends=('plumed')
source=("namd-git.config"
        "namd-git.diff")
md5sums=('b86e6eb88be3f087299bbd8231e15539'
         'a91673a94308ebfc6116ae50bafb4bcb')

package() {
    install -Dm644 ${srcdir}/namd-git.diff ${pkgdir}/usr/lib/plumed/patches/namd-git.diff
    install -Dm644 ${srcdir}/namd-git.config ${pkgdir}/usr/lib/plumed/patches/namd-git.config
}
