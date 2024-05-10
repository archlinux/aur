# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=5.3.3
pkgrel=1
arch=('x86_64')
pkgdesc="Hash Calculator is the console tool that can calculate about 50 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2344151ea984da5b21df88fb32ae98752b48888a2844443da1682dd96ecb0abc')

build() {
	return 0
}

package() {
	install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
