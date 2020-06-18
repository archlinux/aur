# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Powerful yet easy to use APK editor"
arch=('x86_64')
provides=("${pkgname%-bin}")
url='https://qwertycube.com/apk-editor-studio'
license=('GPL3')
depends=('qt5-base'
         'java-runtime>=8'
         'hicolor-icon-theme'
         'android-sdk-build-tools'
         'android-sdk-platform-tools'
         'android-apktool')
optdepends=('libsecret: Enable password manager backend')
source=("${pkgname}-${pkgver}.deb::https://github.com/kefir500/apk-editor-studio/releases/download/v${pkgver}/apk-editor-studio_linux_${pkgver}.deb")
sha256sums=('7383abad2a5996e02076173a4cbcbe417fce591531631a682c0aaaa7335d92d2')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}