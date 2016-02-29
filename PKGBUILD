# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=4.3
_sdkint=18
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('73e879ce46c04a6e63ad1a9107018b4782945007')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
