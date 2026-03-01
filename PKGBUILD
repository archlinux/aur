# Maintainer: Daniel Smith <hello@grabchars.org>
pkgname=grabchars-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Get keystrokes directly from user - interactive terminal input for shell scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/DanielSmith/grabchars"
license=('Apache-2.0')
provides=('grabchars')
conflicts=('grabchars')

source_x86_64=("grabchars-${pkgver}-x86_64.tar.gz::https://github.com/DanielSmith/grabchars/releases/download/v${pkgver}/grabchars-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("grabchars-${pkgver}-aarch64.tar.gz::https://github.com/DanielSmith/grabchars/releases/download/v${pkgver}/grabchars-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('8be33210502654d1709f1165643505316772fc78e5235b388bfe38246b32f977')
sha256sums_aarch64=('659e4f75e3d0427869f6293359ed172d0ec4832e0323ef222ac33c421f0f6826')

package() {
    install -Dm755 "${srcdir}/grabchars" "${pkgdir}/usr/bin/grabchars"
}
