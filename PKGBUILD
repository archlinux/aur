# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.5.1
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1f120f9cdaf687b06c89e8e69594b0aec3328dc04c8229cff5693e1dd74630f4')
sha256sums_aarch64=('6a74294700ce7b2171f7d23a80715df3fba88c5205a18b736999b850e970caab')

build() {
	return 0
}

package() {
	conflicts=("editorconfiger")
	install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
