# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles (pre-built binary)"
arch=('x86_64')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
provides=('ccuse')
conflicts=('ccuse')
options=('!debug')
source_x86_64=("ccuse-$pkgver::https://github.com/wjsoj/ccuse/releases/download/v$pkgver/ccuse-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('69066d8900fb5390e5113b4cfc8a11291c324190fbafe0e5c8080b74a8668486')

package() {
  install -Dm755 "$srcdir/ccuse-$pkgver" "$pkgdir/usr/bin/ccuse"
}
