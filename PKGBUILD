# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam and camera and microphone control for Linux"
pkgver=1.1
pkgrel=1
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas')
optdepends=('qt5gtk2' 'qt5ct')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/2967a68e1d10f0aaee61f062f2b58ddb/CameraControl-1.1.tar.bz2)
sha256sums=('06b7d9b8c232965eecb21fe66e58e81dee9970390a3235888652faba66087516')

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
