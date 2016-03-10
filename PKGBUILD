# Maintainer Jesse Jaara <gmail.com: jesse.jaara>

_rev=r02
_sdkver=4.0.0
_sdkint=14
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url='http://developer.android.com/sdk/index.html'
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_armv7a-${_sdkint}_${_rev}.zip")
sha1sums=('d8991b0c06b18d7d6ed4169d67460ee1add6661b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
