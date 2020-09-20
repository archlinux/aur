# Maintainer: linuxer <linuxer@artixlinux.org> 

pkgname=cameracontrol-bin
pkgdesc="Webcam, camera and microphone control for Linux - Έλεγχος webcam και camera και μικροφώνου για Linux"
pkgver=2.0.5
pkgrel=1
_pkgver=2-0-5
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
sha256sums=('f638b28e0921ad67f45f032f701cfb4b80b04147afa93d1d9d35ca71668ebcc0')


package() {
  cd "$srcdir"
  pwd
  install -Dm755 "$pkgname.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
