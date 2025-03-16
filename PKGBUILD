# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.5.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('05996a113fbdc2106fafe17450b6a945cea40b6084c99463c7f77c37a721a6eb')
sha256sums_aarch64=('edcbb4000e1a7f4107e264bec03ff23772d27f7b537f7b8904c2982dae998a0b')

build() {
	return 0
}

package() {
	conflicts=("editorconfiger")
	install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
