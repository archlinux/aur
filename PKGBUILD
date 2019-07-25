# Maintainer: tequa
pkgname=mkinitcpio-haveged
pkgver=0.1
pkgrel=2
pkgdesc="mkinitcpio hook to run haveged for entropy generation"
arch=(any)
license=('GPL')
url="https://aur.archlinux.org/packages/mkinitcpio-haveged/"
depends=(mkinitcpio haveged)
source=('haveged.hook'
        'haveged.install')
sha256sums=('81a509fd1db18e8ecd07401ce2436d36e10509e02c359b1962334a18dcb8c7e2'
            '9b93942026e5e9d17e3f43274a39df78310a326ff02a3655e87678c9c4d8631f')

package() {
  install -Dm 644 haveged.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/haveged"
  install -Dm 644 haveged.install \
     "${pkgdir}/usr/lib/initcpio/install/haveged"
}
