# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-v$pkgver-x86_64-linux.tar.xz")
sha256sums=('396ac8986faba7574e08b9fd36744b954ad3bef5d4a2843eef0f745a3719be8d')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-v$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
