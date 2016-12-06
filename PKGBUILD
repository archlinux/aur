# Maintainer: Jenya Sovetkin <e.sovetkin@gmail.com>
# Contributors: https://aur.archlinux.org/account/f4bio
pkgname=mkinitcpio-openswap
pkgver=0.1.0
pkgrel=1
pkgdesc="mkinitcpio hook to open swap at boot time"
arch=(any)
license=('unknown')
url="https://aur.archlinux.org/packages/mkinitcpio-openswap/"
depends=(mkinitcpio)
backup=('etc/openswap.conf')
install="usage.install"
source=('openswap.hook'
        'openswap.install'
        'openswap.conf')
sha256sums=('ec55cff2d8f71eae70535e706445edb41f416350245b7aa7b322581fd3b38bae'
            '94dd98a953bab2244215a2b20767cdc9500fc438bed9ec27cae72a73766c6b86'
            '9f3533fa36d26f3baeacb56ec34850fb1ad6968374ca1215c9a74bf3faed5606')
                          

package() {  
  install -Dm 644 openswap.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/openswap"
  install -Dm 644 openswap.install \
     "${pkgdir}/usr/lib/initcpio/install/openswap"
  install -Dm 644 openswap.conf \
     "${pkgdir}/etc/openswap.conf"
}
