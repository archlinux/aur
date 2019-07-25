# Maintainer: tequa
pkgname=mkinitcpio-wifi
pkgver=0.2
pkgrel=1
pkgdesc="mkinitcpio hook to enable wifi remote access"
arch=(any)
license=('GPL')
url="https://aur.archlinux.org/packages/mkinitcpio-wifi/"
depends=(mkinitcpio wpa_supplicant iproute2)
optdepends=(mkinitcpio-netconf)
install="mkinitcpio-wifi.install"
source=('wifi.hook'
        'wifi.install')
sha256sums=('6739959b5aedaf9a43352d264d1630ee48b13aa371b7f0c900c672981cde8800'
            '64dd1704fec9eee158f39ab6e6fe24b08cd76d9cc5c657fe0c08ed1f7962a599')

package() {
  install -Dm 644 wifi.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/wifi"
  install -Dm 644 wifi.install \
     "${pkgdir}/usr/lib/initcpio/install/wifi"
}
