# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r06
_sdkver=4.4.3
_sdkint=19
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('19593662771934b0b1e3be56ed18d13e6489bcd4')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-$_sdkver" "${pkgdir}/opt/android-sdk/samples/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
