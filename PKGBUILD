# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam and camera and microphone control for Linux"
pkgver=1.2
pkgrel=1
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-style-plugins')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/09e8c52e7a99ed3ce50587632a671e6c/CameraControl-1.2.tar.bz2)
sha256sums=('aae4a1359d213b04a513e9136a335b4fd1303b67038607074b130491a03aa479')

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
