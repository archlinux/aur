# Maintainer: tequa
pkgname=mkinitcpio-haveged
pkgver=0.1
pkgrel=1
pkgdesc="mkinitcpio hook to run haveged for entropy generation"
arch=(any)
license=('GPL')
url="https://aur.archlinux.org/packages/mkinitcpio-haveged/"
depends=(mkinitcpio haveged)
source=('haveged.hook'
        'haveged.install')
sha256sums=('cd412ba46b4b6f0862567940a1632c8f5d837d4245a6d9553839c29c1805d0e8'
            'fe18ff703bd3d9a9f5a9ee05922f93de253a7a961c79e97ffea30cf37617df9a')

package() {
  install -Dm 644 haveged.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/haveged"
  install -Dm 644 haveged.install \
     "${pkgdir}/usr/lib/initcpio/install/haveged"
}
