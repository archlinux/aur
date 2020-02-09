# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam and camera and microphone control for Linux"
pkgver=1.2
pkgrel=2
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-style-plugins')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/c8e3ecb56818a761af6300190b1cfc77/CameraControl-1.2.tar.bz2)
sha256sums=('a75293ec77238e8c9dd61ac0f2a2a7cc2f29d5d775a576939831b13abf36bbe0')

#build() {
#  cd "$srcdir/$_realname/"
#  
#}

package() {
  cd "$srcdir/"
  install -Dm755 "$pkgalias.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgalias.desktop" -t "$pkgdir/usr/share/applications"
}
