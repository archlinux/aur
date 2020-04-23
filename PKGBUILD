# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam, camera and microphone control for Linux"
pkgver=2.0
pkgrel=1
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof')
conflicts=('cameramonitor')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-styleplugins')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/336bf082967d9dc1785aae993a8091cb/CameraControl-2.0-1.tar.bz2)
sha256sums=('9541716c916d4eae5f411d7aa8911e8c5d073b2464751b52a3a8c08eb6e60b1a')

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
