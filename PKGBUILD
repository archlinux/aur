# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.16.8
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('74c5651ff7ab9019e039d29463b67be966c98ea54ceac0f203ebc147a93772d6')
sha256sums_aarch64=('647aa27e6a291c19b30e0d4783e80389362c79fa9591242ca3297aeba0dd3bf5')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
