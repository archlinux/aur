# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-v$pkgver-x86_64-linux.tar.xz")
sha256sums=('9a402d1f51d4a3c9dcbf063da1742a17a29baa950d476cdea89696c64a1d69df')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-v$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
