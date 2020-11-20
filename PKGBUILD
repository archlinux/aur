# Maintainer: linuxer <linuxer@artixlinux.org> 
# Contributor: linuxer <linuxer@artixlinux.org> 

pkgname=cameracontrol-bin
pkgdesc="Webcam, camera and microphone control for Linux - Έλεγχος webcam και camera και μικροφώνου για Linux"
pkgver=2.1.0
pkgrel=1
_pkgver=2-1-0
replaces=('cameracontrol')
arch=('any')
url="https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof')
conflicts=('cameramonitor')
optdepends=('qt5ct: Qt5 Configuration Utility' 
            'qt5gtk2: another GTK+2.0 integration plugins for Qt5'
            'qt5-styleplugins: additional style plugins for Qt5')
source=("https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator/raw/branch/master/CameraControl-$_pkgver.tar.bz2")
b2sums=('50956b2c87b2798ce3e0267176c92206e7abeb508b8d8e55b2c6f8550be2468db7a5350a1b1737f3d225373fe4f6b94f7a172ca8f6851bf8d83b454d9a254786')


package() {
  cd "$srcdir"
  pwd
  install -Dm755 "$pkgname.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
