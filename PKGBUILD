# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lua51-tiktoken-bin
pkgver=0.2.1
pkgrel=3
pkgdesc="binding of rust tiktoken to lua"
arch=('x86_64')
url="https://github.com/gptlang/lua-tiktoken"
license=('unknown')
provides=("lua51-tiktoken")
depends=('gcc-libs' 'glibc')
conflicts=('luajit-tiktoken-bin')
source=("https://github.com/gptlang/lua-tiktoken/releases/download/$pkgver/tiktoken_core-linux-lua51.so")
sha256sums=('c6ec5e0a1901e525e94178fd21fb7d0fcbc000535b0a549c923397016b6bf3fc')

package() {
  install -Dm755 "tiktoken_core-linux-lua51.so" "$pkgdir/usr/lib/lua/5.1/tiktoken_core.so"
}
