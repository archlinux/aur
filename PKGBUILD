# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=7.0
_sdkint=24
pkgname=android-sources-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
conflicts=("android-sources==${_sdkint,,}")
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha1sums=('6b96115830a83d654479f32ce4b724ca9011148b')

package() {
	  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
	    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
	      chmod -R ugo+rX "${pkgdir}/opt"
      }

