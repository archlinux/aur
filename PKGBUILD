# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles (pre-built binary)"
arch=('x86_64')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
provides=('ccuse')
conflicts=('ccuse')
source_x86_64=("ccuse-$pkgver::https://github.com/wjsoj/ccuse/releases/download/v$pkgver/ccuse-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('8c9db8d958b26090f3f2916a4fed9dd02fd39102aa7347c792018bcc98276f89')

package() {
  install -Dm755 "$srcdir/ccuse-$pkgver" "$pkgdir/usr/bin/ccuse"
}
