# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.9
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('bf608905068f0a7db0de9152a9ca2acbe160f29eefd1355ab52422b9dc1dc84e')
sha256sums_aarch64=('a32029d51309096201f8c04e2661cec7a4a47d454784a3a02c717bbda001f9ab')

build() {
  return 0
}

package() {
  conflicts=("editorconfiger")
  install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
