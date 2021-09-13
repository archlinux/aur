# Maintainer: Вячеслав Зубик
pkgname=zvvonlinetv
_pkgname=ZVVOnlineTV
#pkgfix=fix
pkgver=3.2
pkgrel=5
pkgdesc="TV | IPTV | youtube player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5' 'mpv' 'qt5-multimedia' 'ffmpeg' 'youtube-dl') 

source=("${pkgname}_${pkgver}.deb::https://www.dropbox.com/s/nkg7i996gntb1at/zvvonlinetv_3_2.deb?dl=0")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  chmod -R 755 "${pkgdir}"/usr
  chmod -R 775 "${pkgdir}"/usr/share/ZVVOnlineTV
  chmod -R 775 "${pkgdir}"/usr/share/ZVVOnlineTV/modules/
  }
