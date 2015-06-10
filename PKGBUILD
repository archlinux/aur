# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=sddm-theme-archpaint2-breeze
pkgver=1.1
pkgrel=1
pkgdesc="Adaptation to SDDM of kdm-theme-archpaint2 using breeze components"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('sddm' 'wallpaper-archpaint2' 'breeze')
install="$pkgname.install"
source="https://github.com/Guidobelix/sddm-theme-archpaint2/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='53e1ccff3cd693ebf00f7668b7b1303d'

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r $pkgname-$pkgver "${pkgdir}"/usr/share/sddm/themes/archpaint2-breeze
}
