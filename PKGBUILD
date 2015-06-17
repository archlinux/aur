# Maintainer: M0Rf30

pkgname=kodi-addon-stream
pkgver=1.4.4
pkgrel=1
pkgdesc='A cross-platform XBMC addon designed with the goal of delivering HD content from all across the web.'
classname=plugin.video.stream
arch=('any')
url='http://stream.brysonreece.com/'
license=('GPL3')
depends=('kodi')
options=(!strip)
source=("https://github.com/brysonreece/Stream/archive/v${pkgver}.zip")
install=kodi-addon-stream.install

package() {
  mkdir -p ${pkgdir}/usr/share/kodi/addons/
  cp -r ${srcdir}/Stream-${pkgver}/ ${pkgdir}/usr/share/kodi/addons/${classname}
  rm -r ${pkgdir}/usr/share/kodi/addons/${classname}/resources/bin/{android_arm,darwin_x64,windows_x86}
}

md5sums=('5dc4cf4286a7047514b3c8e9fbac104b')
