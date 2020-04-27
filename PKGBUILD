# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>

# Maintainer: PSposito <http://bit.do/linuxer>
 
pkgname=cameracontrol-bin
pkgbase=cameracontrol
pkgdesc="Webcam, camera and microphone control for Linux - Έλεγχος webcam και camera και μικροφώνου για Linux"
pkgver=2.0
pkgrel=3
replaces=('cameracontrol')
arch=('any')
url="https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof' 'gnome-icon-theme')
conflicts=('cameramonitor')
optdepends=('qt5ct: Qt5 Configuration Utility'
            'qt5gtk2: another GTK+2.0 integration plugins for Qt5'
            'qt5-styleplugins: additional style plugins for Qt5')
source=("https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator/raw/branch/master/CameraControl-2-0-3.tar.bz2")
sha256sums=('9ddbbe1368b344c1b85bb851637a1bee8821c62a939d0ff5c1d59f253732b9fb')
 
 
package() {
  cd "$srcdir"
  pwd
  install -Dm755 "$pkgbase.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgbase.desktop" -t "$pkgdir/usr/share/applications"
}
