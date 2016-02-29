# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=4.3
_sdkint=18
pkgname=android-sources-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
md5sums=('59ce49b8e3a72e540e2d879567c5c7ff')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
  mv "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
