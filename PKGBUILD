# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

_rev=r04
_ver=4.0.2
_api=14
pkgname=android-platform-${_api}
pkgver=${_ver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_api}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${_api}_${_rev}.zip")
sha1sums=('d4f1d8fbca25225b5f0e7a0adf0d39c3d6e60b3c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_ver}" "${pkgdir}/opt/android-sdk/platforms/android-${_api}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
