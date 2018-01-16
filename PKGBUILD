# Maintainer: Halit Alptekin <halitalptekin@sabanciuniv.edu>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r04
_sdkver=4.3
_sdkint=18
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/armeabi-v7a-${_sdkint}_${_rev}.zip")
sha1sums=('0bf34ecf4ddd53f6b1b7fe7dfa12f2887c17e642')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
