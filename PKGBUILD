# Maintainer: Daniel Smith <hello@grabchars.org>
pkgname=grabchars-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Get keystrokes directly from user - interactive terminal input for shell scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/DanielSmith/grabchars"
license=('Apache-2.0')
provides=('grabchars')
conflicts=('grabchars')

source_x86_64=("grabchars-${pkgver}-x86_64.tar.gz::https://github.com/DanielSmith/grabchars/releases/download/v${pkgver}/grabchars-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("grabchars-${pkgver}-aarch64.tar.gz::https://github.com/DanielSmith/grabchars/releases/download/v${pkgver}/grabchars-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('160068be71deaba073dd3232c923094943ac41a4c7114d59acaac382944da278')
sha256sums_aarch64=('1aa5b1a34bbf52a322ce3aabbbfe6287826e7f44c55201c37c5fd70c456a0012')

package() {
    install -Dm755 "${srcdir}/grabchars" "${pkgdir}/usr/bin/grabchars"
}
