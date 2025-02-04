# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.12
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('4924bd00739d2bacc086c230472cb39587ae90893190a47edaa4374d79be800e')
sha256sums_aarch64=('f36e2dd6b88c1ecf9f02668c39ac1ece7c293254c514977b9882f270b115178a')

build() {
	return 0
}

package() {
	conflicts=("editorconfiger")
	install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
