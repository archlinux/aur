# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-armv7a-eabi-system-image-15
pkgver=4.0.4_r03
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, API-15'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-platform-15')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/sysimg_armv7a-15_r03.zip")
sha1sums=('0a47f586e172b1cf3db2ada857a70c2bdec24ef8')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-15/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-15/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
