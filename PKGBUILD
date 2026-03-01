# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles (pre-built binary)"
arch=('x86_64')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
provides=('ccuse')
conflicts=('ccuse')
options=('!debug')
source_x86_64=("ccuse-$pkgver::https://github.com/wjsoj/ccuse/releases/download/v$pkgver/ccuse-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('91d9bcf299dabe378470b0f6cf9f8b16652ed7321047e778aaf1b08b3be02c73')

package() {
  install -Dm755 "$srcdir/ccuse-$pkgver" "$pkgdir/usr/bin/ccuse"
}
