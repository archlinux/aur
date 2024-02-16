# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.4.4
pkgrel=3
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-$pkgver-x86_64-linux.tar.xz")
sha256sums=('80c65bc678c60a3db55aac8451b4c448875e8f80386ec25bc69191f90795ae17')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
