# Maintainer: Вячеслав Зубик
pkgname=zvvonlinetv
_pkgname=ZVVOnlineTV
pkgver=3.2
_pkgver=3_2
pkgfix=fix
pkgrel=3
pkgdesc="TV | IPTV | youtube player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('pyqt5-common' 'python-pyqt5' 'mpv' 'qt5-multimedia' 'ffmpeg' 'youtube-dl') 

source=("${pkgname}_${_pkgver}.deb::https://docs.google.com/uc?id=1_FGSxInNkx2KmxVxNFf-ADAF7hANiYUB")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  #install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  #install -Dm755 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
