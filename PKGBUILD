# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=aws-vault
pkgver=3.7.1
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
#depends=('java-environment' 'lib32-alsa-lib' 'lib32-openal'
#               'lib32-libstdc++5' 'lib32-libxv' 'lib32-mesa' 'lib32-ncurses'
#               'lib32-sdl' 'lib32-zlib' 'lib32-fontconfig' 'lib32-libpulse'
#               'swt')
#optdepends=('android-emulator: emulator has become standalone since 25.3.0'
#            'android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx'
#            'android-udev: udev rules for Android devices')
source=("https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64")
sha256sums=('737897071e5efacaeea2abf88989662d5f45b9bedbf954b224ec4e2d98852f50')

package() {
  install -Dm755 aws-vault-linux-amd64 "${pkgdir}/usr/bin/aws-vault"
}
