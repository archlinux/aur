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
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/53ab815ea166029e500ae0d4899dc62f/CameraControl.tar.bz2)
sha256sums=('2197b28fd124d449e243e1175d3f11f9c5f237b90d90537ad25885872f307be8')

#build() {
#  cd "$srcdir/$_realname/"
#  
#}

package() {
  cd "$srcdir/"
  sudo rm -R /opt/"${_realname}"
  sudo mkdir /opt/"${_realname}"
  sudo cp "$srcdir"/cameracontrol.desktop /usr/share/applications/cameracontrol.desktop
  sudo cp "$srcdir"/CameraControl.sh /opt/CameraControl/CameraControl.sh
  sudo cp "$srcdir"/cameracontrol.bin /opt/CameraControl/cameracontrol.bin
  sudo chmod +x /usr/share/applications/cameracontrol.desktop
  sudo chmod +x "/opt/CameraControl/cameracontrol.bin"
  sudo chmod +x "/opt/CameraControl/CameraControl.sh"
}
