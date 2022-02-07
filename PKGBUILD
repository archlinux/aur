# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/$pkgver/cotp-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('bef81982ea1e38eb29eb248b22cbeb0d4727cce6f943a468c31f40884e3936d5')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/usr/bin/cotp" "${pkgdir}/usr/bin/cotp"
}
