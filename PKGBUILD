# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=sddm-theme-archpaint2
pkgver=1.1
pkgrel=1
pkgdesc="Adaptation to SDDM of kdm-theme-archpaint2"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('sddm' 'wallpaper-archpaint2')
install="$pkgname.install"
source="https://github.com/Guidobelix/sddm-theme-archpaint2/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='9583988ef78a18661114cf7af9f92f17'

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r $pkgname-$pkgver "${pkgdir}"/usr/share/sddm/themes/archpaint2
}
