# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkver=4.4
_sdkint=19
pkgname=android-sources-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
md5sums=('faedd288e735b2dedce7ef3a045dbca1')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
  mv "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
