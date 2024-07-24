# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=luajit-tiktoken-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="binding of rust tiktoken to lua"
arch=('x86_64')
url="https://github.com/gptlang/lua-tiktoken"
license=('unknown')
provides=("luajit-tiktoken")
depends=('gcc-libs' 'glibc')
conflicts=('lua51-tiktoken-bin')
source=("https://github.com/gptlang/lua-tiktoken/releases/download/$pkgver/tiktoken_core-linux-luajit.so")
sha256sums=('3143b29460a5664a79c453e5013dbff9a7527bbe5d083709721a49250f8e6e40')

package() {
  install -Dm755 "tiktoken_core-linux-luajit.so" "$pkgdir/usr/lib/lua/5.1/tiktoken_core.so"
}
