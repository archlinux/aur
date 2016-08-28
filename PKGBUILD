# Maintainer: Sandor Nagy <sandor-dot-nagy-at-kdemail-dot-net>
# Contributor: Joel Pedraza <joel@joelpedraza.com>

_rev=r03
_sdkver=4.4W
_sdkint=20
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkint}_${_rev}.zip")
sha1sums=('8b1290b0b707827808392e8178094a68dfb51a14')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkver}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
