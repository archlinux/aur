# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.6.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('999d58987c71f9c3c9418f06f48802c231ac8008b57343384cc61920793487bc')
sha256sums_aarch64=('1ce94b3be7d2f06ab5d9d6fc11a217904143a86b57f21911143290a36497f787')

build() {
  return 0
}

package() {
  conflicts=("editorconfiger")
  install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
