# Maintainer:  RogueGirl <3a33oxx40 at mozmail dot com>

pkgname=obs-kinect-bin
pkgver=1.0.rc2 
pkgrel=1
pkgdesc="OBS Plugin to use a Kinect (all models supported) in OBS (and setup a virtual green screen based on depth and/or body detection). "
arch=('x86_64')
url="https://github.com/SirLynix/obs-kinect"
license=('GPL2')
depends=('libfreenect' 'obs-studio')
source=("$pkgname.tar.gz::$url/releases/download/v1.0-rc2/linux-1.0rc2-x64-releasedbg.zip")

package() {
  install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-kinect
  install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-kinect/locale
  install -d ${pkgdir}/usr/lib/obs-plugins
  install -D -m 755 ${srcdir}/data/obs-plugins/obs-kinect/*.effect ${pkgdir}/usr/share/obs/obs-plugins/obs-kinect
  install -D -m 755 ${srcdir}/data/obs-plugins/obs-kinect/locale/*.ini ${pkgdir}/usr/share/obs/obs-plugins/obs-kinect/locale
  install -D -m 755 ${srcdir}/obs-plugins/64bit/*.so  ${pkgdir}/usr/lib/obs-plugins
}
sha256sums=('868475c2a8c7742318162d1f38f2231816e05b531b9b8f6a9c6d6fefcf275555')
