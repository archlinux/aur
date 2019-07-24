# Maintainer: tequa
pkgname=mkinitcpio-wifi
pkgver=0.1
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
sha256sums=('d09c82d7b2756166b951de66d36094e4f03dfd5cd961cc1fa0852e119d09c828'
            '325fd5aecf747549559eafa243be023c00276ca3c429c3d1222101f2075b7768')

package() {
  install -Dm 644 wifi.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/wifi"
  install -Dm 644 wifi.install \
     "${pkgdir}/usr/lib/initcpio/install/wifi"
}
