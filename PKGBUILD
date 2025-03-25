# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=5.4.1
pkgrel=1
arch=('x86_64')
pkgdesc="Hash Calculator is the console tool that can calculate about 50 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e07153741326fcb70a45a2a05e3ed7c1ae948ecf754574a3c74ce6525b184cbc')

build() {
	return 0
}

package() {
	install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
