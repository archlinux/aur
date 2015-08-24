# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-sources

_rev=r01
_apilevel=23
pkgname=android-sources
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sources-23_r01.zip")
sha1sums=('b0f15da2762b42f543c5e364c2b15b198cc99cc2')

package() {
  install -d "${pkgdir}/opt/android-sdk/sources/"
  mv "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_apilevel}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
