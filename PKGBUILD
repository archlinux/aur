# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=1.3.2
pkgrel=1
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL 2')
depends=('python-pyqt5' 'python-numpy' 'hdf5' 'ffmpeg' 'python-opencv')
install='vc.install'
arch=('x86_64')
source=(https://raw.githubusercontent.com/kanehekili/VideoCut/master/build/videocut1.3.2.tar)
md5sums=(2be003a951cc812067221f7a3b0bef8d)
package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  rm  $srcdir/$pkgname/install.sh
  rm  $srcdir/$pkgname/uninstall.sh
  cp  $srcdir/$pkgname/VideoCut.desktop "${pkgdir}/usr/share/applications"
  cp -r $srcdir/$pkgname/* "${pkgdir}/opt/${pkgname}"  || return 1
}


