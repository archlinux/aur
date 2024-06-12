# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.8
pkgrel=1
arch=('x86_64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('b889e823fbdafb36fa002516e292c623f8d37e9db9ab77280ea2a0ce79af745b')

build() {
  return 0
}

package() {
  conflicts=("editorconfiger")
  install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
