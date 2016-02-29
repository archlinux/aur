# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_rev=r02
_sdkver=L
_sdkint=20
pkgname=android-samples-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Samples, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/samples-${_sdkver}_${_rev}.zip")
sha1sums=('4afc36cf3f53051881729f733fe9bb571104c48f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/samples/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/samples/android-${_sdkver}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
