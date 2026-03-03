# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles (pre-built binary)"
arch=('x86_64')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
provides=('ccuse')
conflicts=('ccuse')
options=('!debug')
source_x86_64=("ccuse-$pkgver::https://github.com/wjsoj/ccuse/releases/download/v$pkgver/ccuse-x86_64-unknown-linux-gnu")
sha256sums_x86_64=('ed77979a32b7a88355a9d1f260707a38e3e0f367bfe8236d37d2f7e51cd9525d')

package() {
  install -Dm755 "$srcdir/ccuse-$pkgver" "$pkgdir/usr/bin/ccuse"
}
