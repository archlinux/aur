# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=plasma-theme-archpaint2
pkgver=1.2
pkgrel=1
pkgdesc="Plasma 5 theme based on archpaint2 wallpaper"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('wallpaper-archpaint2' 'plasma-workspace')
install="$pkgname.install"
source="https://github.com/Guidobelix/plasma-theme-archpaint2/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='74b5ff74d2c60eb5be118c24977cfc7d'

package() {
  mkdir -p "${pkgdir}"/usr/share/plasma/look-and-feel
  cp -r "$pkgname-$pkgver"/org.archlinux.archpaint2 "${pkgdir}"/usr/share/plasma/look-and-feel/org.archlinux.archpaint2
  mkdir -p "${pkgdir}"/usr/share/wallpapers
  cp -r "$pkgname-$pkgver"/Archpaint2 "${pkgdir}"/usr/share/wallpapers/Archpaint2
}
