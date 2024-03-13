# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=5.3.1
pkgrel=1
arch=('x86_64')
pkgdesc="Hash Calculator is the console tool that can calculate about 50 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('522975e0a20801a3c1e28c6613d2ce76b068a1a07ed6ac44282212eca4f8c0a5')

build() {
	return 0
}

package() {
	install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
