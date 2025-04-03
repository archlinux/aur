# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
# Contributor: Guidobelix <guidobelix at hotmail dot it>

pkgname=archlinux-themes-sddm
pkgver=2.0
pkgrel=2
pkgdesc="Adaptation to SDDM of Archlinux themes made for KDM"
arch=('any')
url="https://github.com/Guidobelix/archlinux-themes-sddm"
license=('CC-BY-SA-3.0')
depends=('sddm')
install="$pkgname.install"
source=("https://github.com/Guidobelix/archlinux-themes-sddm/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('80aca91263237500e8317bbcf7ff428db320ae0c9f7f3d5d2560053a5f10de96')

package() {
  cd $pkgname-$pkgver
  mkdir -p "${pkgdir}/usr/share/sddm/themes"
  cp -R archlinux-* "${pkgdir}/usr/share/sddm/themes/"
  chmod -R 755 "${pkgdir}/usr/share/sddm/themes/archlinux-"*
}
