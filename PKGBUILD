# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/$pkgver/cotp-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('cfc0e80459fd43771bd54e6032aeca38bf55222f550063f3031f11f6be8bb852')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/usr/bin/cotp" "${pkgdir}/usr/bin/cotp"
}
