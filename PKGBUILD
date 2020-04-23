# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam, camera and microphone control for Linux"
pkgver=2.0
pkgrel=3
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof')
conflicts=('cameramonitor')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-style-plugins')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/0fe9685a3a6ae587a1982eba82b57902/CameraControl-2-0-3.tar.bz2)
sha256sums=('9ddbbe1368b344c1b85bb851637a1bee8821c62a939d0ff5c1d59f253732b9fb')

#build() {
#  cd "$srcdir/$_realname/"
#  
#}

package() {
  cd "$srcdir/"
  pwd
  install -Dm755 "$pkgalias.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgalias.desktop" -t "$pkgdir/usr/share/applications"
}
