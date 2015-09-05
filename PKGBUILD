# Maintainer: Sandor Nagy <sanya868-at-gmail-dot-com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-support
pkgver=r23.0.1
pkgrel=1
pkgdesc='Android Support Package'
arch=('any')
url="https://developer.android.com/sdk/compatibility-library.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/support_${pkgver}.zip")
sha1sums=('fbe529716943053d0ce0d7f058d79f1a848cdff9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  mv "${srcdir}/support" "${pkgdir}/opt/android-sdk/extras/android/support"

  chmod -R ugo+rX "${pkgdir}/opt"
}
