# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Έλεγχος webcam και camera και μικροφώνου για Linux - Webcam, camera and microphone control for Linux"
pkgver=2.0
pkgrel=4
pkgbase=cameracontrol-bin
replaces=('cameracontrol')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof')
conflicts=('cameramonitor')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-styleplugins')
source=("https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator/src/branch/master/CameraControl-2-0-4.tar.bz2")
sha256sums=('e4b53b4f304267cd9f29a870797ac57e949583d7f574945df3931265087a060e')

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
