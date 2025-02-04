# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.16.9
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('7da3f0cd576eb4d15897bb487ecef562ef57ed7b5e42ed4638f99c962fe51106')
sha256sums_aarch64=('cf9eabb72bc99f15777edf06beaf8e22abadb511338e57c964a545e92219dde7')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
