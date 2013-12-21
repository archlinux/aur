# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkver=4.4.2
_sdkint=19
pkgname=android-google-apis
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_sdkint}")
conflicts=("${pkgname}-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/google_apis-${_sdkint}_${_rev}.zip")
md5sums=('0dbdefed6fcb62fd747501b64a21c837')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/google_apis-938007-mac-x86" "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
