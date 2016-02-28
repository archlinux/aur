# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-samples-16
pkgver=4.1_r01
pkgrel=1
pkgdesc='Android SDK Samples, API-16'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/samples-16_r01.zip")
sha1sums=('dce3a2d41db50a381ef47ee8bddbe928520e685e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-4.1" "${pkgdir}/opt/android-sdk/samples/android-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
