# Maintainer: Slava Zubik
pkgname=zvvonlinetv
_pkgname=ZVVOnlineTV
pkgver=3.2
_pkgver=3_2
pkgfix=fix
pkgrel=1
pkgdesc="TV, IPTV & youtube player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('pyqt5-common' 'python-pyqt5' 'mpv' 'qt5-multimedia' 'ffmpeg' 'youtube-dl') 

source=("${pkgname}_${_pkgver}.deb::https://docs.google.com/uc?id=1_FGSxInNkx2KmxVxNFf-ADAF7hANiYUB")
md5sums=('bdd989265546d5f8a109d154695a2995')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
