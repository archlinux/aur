# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=1.4.5
pkgrel=2
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/cotp-$pkgver-x86_64-linux.tar.xz")
sha256sums=('0191538cfe09d8411b9e9f0fa01ae8b4e59f61ecd012de4f7116c16e30791fde')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/cotp-$pkgver-x86_64-linux/cotp" "${pkgdir}/usr/bin/cotp"
}
