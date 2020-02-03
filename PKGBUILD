# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και μικροφώνου - Webcam and microphone control"
pkgver=1.0
pkgrel=1
pkgbase=cameracontrol
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
optdepends=('qt5gtk2')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/53ab815ea166029e500ae0d4899dc62f/CameraControl.tar.bz2)
sha256sums=('2197b28fd124d449e243e1175d3f11f9c5f237b90d90537ad25885872f307be8')

#build() {
#  cd "$srcdir/$_realname/"
#  
#}

package() {
  cd "$srcdir/"
  install -Dm755 "$pkgname.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
