# Maintainer: M0Rf30

pkgname=kodi-addon-stream
pkgver=1.4.6RC3
pkgrel=1
pkgdesc='A cross-platform XBMC addon designed with the goal of delivering HD content from all across the web.'
classname=plugin.video.stream
arch=('any')
url='https://github.com/brysonreece/Stream/'
license=('GPL3')
depends=('kodi')
options=(!strip)
source=("https://github.com/brysonreece/Stream/archive/v1.4.6-RC3.zip")
install=kodi-addon-stream.install

package() {
  mkdir -p ${pkgdir}/usr/share/kodi/addons/
  cp -r ${srcdir}/Stream-1.4.6-RC3/ ${pkgdir}/usr/share/kodi/addons/${classname}
  rm -r ${pkgdir}/usr/share/kodi/addons/${classname}/resources/bin/{android_arm,darwin_x64,windows_x86}
}

md5sums=('009ea4b96a3ec7c4b7cd205635dfac26')
