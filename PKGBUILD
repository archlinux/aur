# Maintainer: Christian Humm <mail@c-m-l.net>

pkgname=antergos-wallpapers
pkgver=0.7
pkgrel=3
pkgdesc="The default wallpapers for Antergos"
arch=('any')
url="http://www.antergos.com"
license=('CCPL:by-nc-sa')
source=("http://mirrors.antergos.com/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('15b255ebf16fa4910b08ff59a0421b75d0b5289ffc62227990d619a730105fff')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/antergos/wallpapers"
  install -m644 usr/share/antergos/wallpapers/*.jpg "${pkgdir}/usr/share/antergos/wallpapers/"
  install -m644 usr/share/antergos/wallpapers/*.png "${pkgdir}/usr/share/antergos/wallpapers/"

  install -d "${pkgdir}/usr/share/cinnamon-background-properties"
  install -m644 usr/share/cinnamon-background-properties/antergos.xml "${pkgdir}/usr/share/cinnamon-background-properties/"

  install -d "${pkgdir}/usr/share/gnome-background-properties"
  install -m644 usr/share/gnome-background-properties/antergos-backgrounds-4-3.xml "${pkgdir}/usr/share/gnome-background-properties/"
}
