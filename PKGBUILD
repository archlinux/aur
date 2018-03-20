# Maintaner: GFdevelop
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_apilevel=23
pkgname=android-sources-${_apilevel}
pkgver=r01
pkgrel=1
pkgdesc="Android SDK Sources, API-${_apilevel}"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_apilevel}_${pkgver}.zip")
sha1sums=('b0f15da2762b42f543c5e364c2b15b198cc99cc2')

package() {
  _destdir="${pkgdir}/opt/android-sdk/sources/"
  mkdir -p "${_destdir}"
  mv "${srcdir}/src" "${_destdir}/android-${_apilevel}"
  chmod -R ugo+rX "${pkgdir}/opt"
}
