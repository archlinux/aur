pkgname=android-platform-13
pkgver=3.2_r01
pkgrel=2
pkgdesc='Android SDK Platform, API-13'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android-${pkgver}-linux.zip")
sha1sums=('6189a500a8c44ae73a439604363de93591163cd9')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${pkgver}-linux" "${pkgdir}/opt/android-sdk/platforms/android-13"

  chmod -R ugo+rX "${pkgdir}/opt"
}
