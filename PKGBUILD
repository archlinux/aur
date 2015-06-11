# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=plasma-theme-archlinux
pkgver=1.0
pkgrel=2
pkgdesc="Plasma 5 theme inspired by Archlinux minimalism"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('plasma-workspace')
install="$pkgname.install"
source="https://github.com/Guidobelix/plasma-theme-archlinux/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='bf2eb7796c90a09960d9b2c77c33c5d8'

package() {
  mkdir -p "${pkgdir}"/usr/share/plasma/look-and-feel
  cp -r "$pkgname-$pkgver"/look-and-feel/org.archlinux.archlinux "${pkgdir}"/usr/share/plasma/look-and-feel/org.archlinux.archlinux
  mkdir -p "${pkgdir}"/usr/share/wallpapers
  cp -r "$pkgname-$pkgver"/wallpapers/Archlinux "${pkgdir}"/usr/share/wallpapers/Archlinux
  mkdir -p "${pkgdir}"/usr/share/plasma/desktoptheme
  cp -r "$pkgname-$pkgver"/desktoptheme/archlinux "${pkgdir}"/usr/share/plasma/desktoptheme/archlinux
  mkdir -p "${pkgdir}"/usr/share/color-schemes
  for t in Archlinux ArchlinuxDark; do
    cp  "$pkgname-$pkgver"/color-schemes/$t.colors "${pkgdir}"/usr/share/color-schemes/
  done
}
