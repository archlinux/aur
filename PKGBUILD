# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r04
_sdkver=5.0.1
_sdkint=21
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('3a08d37e97f567f5f629a06a9012f89b05c5ad8a')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
