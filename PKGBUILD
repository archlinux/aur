# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.13
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f23c804a43c91fd4c1b050c37dc44647145c97f187841d7342ce3050e9d2af62')
sha256sums_aarch64=('62653738fb2fe91401302aae9a2800c1f09a9f6ef4753d713c239582ef05719e')

build() {
	return 0
}

package() {
	conflicts=("editorconfiger")
	install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
