# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.17.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('aa534d75e2fef1a5ccccfdcb437d18ad4d2837a284dcb4c1fe36062331c19638')
sha256sums_aarch64=('0dd3bfe99586bc9b3fb48abc0911c334e3cf21780f0e54f1b7b0cd9db2968517')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
