# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-v$pkgver-x86_64-linux.tar.xz")
sha256sums=('775e23d462f2299d70cbbda8b637ba5958704c3ed6a7b1af3f3e38127bf20489')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-v$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
