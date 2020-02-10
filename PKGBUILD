# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

pkgname=cameracontrol-bin
pkgalias=cameracontrol
_realname=CameraControl
pkgdesc="Camera Control for Linux / Audio Control - Έλεγχος camera / μικροφώνου για Linux"
pkgver=1.3
pkgrel=1
pkgbase=cameracontrol-bin
replaces=('cameracontrol-bin')
arch=('any')
url="https://gitlab.com/psposito/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas')
optdepends=('qt5gtk2' 'qt5ct' 'qt5-style-plugins')
source=(https://gitlab.com/psposito/camera-control-webcam-switch-indicator/uploads/cb6034746b37b7f18cd6e7bdad5e47eb/CameraControl-1.3-1.tar.bz2)
sha256sums=('6b81394e2ac429e71085b676525755df4a9964dfa30a61e6c9b917ac635b35db')

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
