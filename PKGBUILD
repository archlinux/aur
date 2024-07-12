# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.10
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('216e15ca7cb5752a11202d695a74116ee401379f9645e50de6f60fd136cca2d2')
sha256sums_aarch64=('99881dab30f84c5be3ed1e5ef57dbc0e121ff5b088c18fa3d87222af96516268')

build() {
  return 0
}

package() {
  conflicts=("editorconfiger")
  install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
