# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r02
_sdkver=6.0
_sdkint=23
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('94d2857476987cfb7b18c8be61755c21b0a6e599')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
