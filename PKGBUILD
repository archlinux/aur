# Maintainer: tequa
pkgname=mkinitcpio-wifi
pkgver=0.1
pkgrel=2
pkgdesc="mkinitcpio hook to enable wifi remote access"
arch=(any)
license=('GPL')
url="https://aur.archlinux.org/packages/mkinitcpio-wifi/"
depends=(mkinitcpio wpa_supplicant iproute2)
optdepends=(mkinitcpio-netconf)
install="mkinitcpio-wifi.install"
source=('wifi.hook'
        'wifi.install')
sha256sums=('e70a34a0a2ecf0d0d46308105b4be5dd8f245d32bac6e4a429fed35f433037bb'
            '64dd1704fec9eee158f39ab6e6fe24b08cd76d9cc5c657fe0c08ed1f7962a599')

package() {
  install -Dm 644 wifi.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/wifi"
  install -Dm 644 wifi.install \
     "${pkgdir}/usr/lib/initcpio/install/wifi"
}
