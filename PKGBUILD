# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-v$pkgver-x86_64-linux.tar.xz")
sha256sums=('1eaa7c882fadeba74371e7d72498e5c9b52e09b2a7191867a0c599ea0f2abc1b')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-v$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
