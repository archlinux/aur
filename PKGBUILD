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
sha256sums=('3b8f074c7dde12d4cd7d57d5c24b6dd9c8c8565a455adbf47717849c51a322d1')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/usr/bin/cotp" "${pkgdir}/usr/bin/cotp"
}
