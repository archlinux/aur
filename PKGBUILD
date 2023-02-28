# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-v$pkgver-x86_64-linux.tar.xz")
sha256sums=('693f3563c425d5e39865679832932ce9367e81252954e32d1e8fbd6fffc81501')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-v$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
