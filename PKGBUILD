# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-sources-16
pkgver=4.1.1_r02
pkgrel=1
pkgdesc='Android SDK Sources, API-16'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sources-16_r02.zip")
sha1sums=('0f83c14ed333c45d962279ab5d6bc98a0269ef84')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
  mv "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-16"

  chmod -R ugo+rX "${pkgdir}/opt"
}
