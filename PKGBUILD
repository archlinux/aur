# Maintainer: tequa
pkgname=mkinitcpio-wifi
pkgver=0.3
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
sha256sums=('6af8f536a1ca30c5702acc63ee70346568643d234df7729f3ba70197ef4dd723'
            '445dbe0457ae61fc053660e2935d925cd8949b449c3f88e36c72d1f1093a553c')

package() {
  install -Dm 644 wifi.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/wifi"
  install -Dm 644 wifi.install \
     "${pkgdir}/usr/lib/initcpio/install/wifi"
}
