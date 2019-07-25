# Maintainer: tequa
pkgname=mkinitcpio-haveged
pkgver=0.2
pkgrel=1
pkgdesc="mkinitcpio hook to run haveged for entropy generation"
arch=(any)
license=('GPL')
url="https://aur.archlinux.org/packages/mkinitcpio-haveged/"
depends=(mkinitcpio haveged)
source=('haveged.hook'
        'haveged.install')
sha256sums=('68678f6c4c5ba850031ca90452f4f2c5e496bc0a58f4224314750e37064b93d6'
            '9b93942026e5e9d17e3f43274a39df78310a326ff02a3655e87678c9c4d8631f')

package() {
  install -Dm 644 haveged.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/haveged"
  install -Dm 644 haveged.install \
     "${pkgdir}/usr/lib/initcpio/install/haveged"
}
