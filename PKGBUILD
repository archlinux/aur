# Maintainer: Jenya Sovetkin <e.sovetkin@gmail.com>
pkgname=mkinitcpio-openswap
pkgver=0.0.0
pkgrel=2
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
md5sums=('a5b52e3c3b5dc592f41567b21ec2e9cf'
         'ae743e0fd95cc1c07705cf7c472416b1'
         '8a72bf00f155512490884eb4911cc4f4')


package() {  
  install -Dm 644 openswap.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/openswap"
  install -Dm 644 openswap.install \
     "${pkgdir}/usr/lib/initcpio/install/openswap"
  install -Dm 644 openswap.conf \
     "${pkgdir}/etc/openswap.conf"
}
