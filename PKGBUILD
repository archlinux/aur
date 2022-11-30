# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: Guidobelix <guidobelix at hotmail dot it>

pkgname=cachyos-themes-sddm
pkgver=1.0
pkgrel=1
pkgdesc="CachyOS-branded SDDM adaptation of archlinux-themes-kdm"
arch=('any')
url="https://github.com/StarterX4/cachyos-themes-sddm"
license=('CCPL:cc-by-sa')
depends=('sddm')
install="$pkgname.install"
source=("https://github.com/StarterX4/cachyos-themes-sddm/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('f2924f3fa96f993abd9d4b06864c62ef')

package() {
  for t in simplyblack softgrey; do
    install -d "${pkgdir}"/usr/share/sddm/themes/cachyos-$t
    install -Dm644 cachyos-$t/{AUTHORS,COPYING,metadata.desktop,cachyos.png,cachyOSGreentext.png,background.png,Main.qml,screenshot.png,angle-down.png,theme.conf} \
      "${pkgdir}"/usr/share/sddm/themes/cachyos-$t
  done
}
