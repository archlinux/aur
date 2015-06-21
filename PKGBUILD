# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r06
_sdkver=5.1.1
_sdkint=22
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('1f6f4a81a8f19a9b9c9bf4adb64a91330a861c7f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
