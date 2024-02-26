# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.16.0
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('5560239bd7b7ad1b3c8a43835806f33a2af65fe67886df0ef450cad7c61507b5')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
