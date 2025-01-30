# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.11
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d513be5dfd1d9ae4f3ed82dac75fe54a184f97ce45e4167bd325231939745cad')
sha256sums_aarch64=('c9d06ddd89248f2028910100a4d23c8170d79f24c60d10f77b0bea34f8acd2e7')

build() {
	return 0
}

package() {
	conflicts=("editorconfiger")
	install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
