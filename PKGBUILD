# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.5.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('16f657da18eb7c51efbefeea91f3b5433ab6bd8f5f66cfb39b12ff72cadb80cd')
sha256sums_aarch64=('3d4c25ab03179bd6bfc989634b5ec98d261bc8a3bf11c50abe9b05e205c8f800')

build() {
  return 0
}

package() {
  conflicts=("editorconfiger")
  install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
