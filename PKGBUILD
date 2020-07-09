# Maintainer: barfin
pkgname=ipwebcam
pkgver=20200624
pkgrel=1
pkgdesc="Simple shell script for using IP Webcam as a V4L2 webcam / sound source "
arch=("any")
url="https://github.com/bluezio/ipwebcam-gst"
license=('unknown')
depends=("v4l2loopback-dkms")
source=("https://raw.githubusercontent.com/bluezio/ipwebcam-gst/master/prepare-videochat.sh")
md5sums=('5efb2cdde2e336641e188c197534c375')

package() {
  install -Dm755 "${srcdir}/prepare-videochat.sh" "${pkgdir}/opt/ipwebcam/ipwebcam"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/ipwebcam/ipwebcam" "${pkgdir}/usr/bin/ipwebcam"
  
}
