# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.15.3
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('e9554b1e1dce8b6288f66d295d7dbbc3f17e1188f882f1b482a14b17ee4340f7')

build() {
	return 0
}

package() {
	conflicts=("solv")

	install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
