# Maintainer: atriix <aur a snilius d com>

pkgname=apk-resigner
pkgver=1
pkgrel=2
pkgdesc='A bash script utility that resigns the Android Package (APK) files (Android applications) with different certificates.'
url="https://code.google.com/p/apk-resigner/"
arch=('i686' 'x86_64' 'arm')
license=('Apache License 2.0')
install=apk-resigner.install
optdepends=('android-sdk-build-tools: build tools are required, however you may provide this via your own Android SDK setup in PATH')
depends=(java-environment-common)

source=("signapk.sh" "apk-resigner.install")
sha512sums=('fce7e6fbf9ed702f559772535eb8078756cf1c69c2873e71a1421f8e05d5039d0fa88157cd21d607554720edb72f70774be4589ba08569fbe7c8b42cd91d03d6'
            '94bc7f2874c51c215c4ec60dd6226ce3b12e85669b5104cf9504a9caeb6d506562212b6ac813b0653a71de9dc6acbf340501d8cf5be5174ef0aa274478ce9d37')

package() {
  install -Dm0755 ${srcdir}/signapk.sh ${pkgdir}/usr/bin/signapk.sh
}

# vim:set ts=2 sw=2 et:
