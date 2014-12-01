# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=5.0
_sdkint=21
pkgname=android-sources
pkgver=${_sdkint}_${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Last Android SDK Sources."
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha512sums=('c80de09369161ffad77ecf641bf1f833add758e8161de077665331b20f635ad926ce792a79a136a020a21643df49b54861e1de46965be0d2cad13c59a41ac380')

package() {
  install -d $pkgdir/opt/android-sdk/sources/
  mv $srcdir/src $pkgdir/opt/android-sdk/sources/android-$_sdkint

  chmod -R ugo+rX $pkgdir/opt
}
