# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tabnine
pkgver=3.7.25
pkgrel=1
pkgdesc="AI-powered autocompletion engine"
arch=('x86_64' 'i686')
url="https://tabnine.com"
license=('custom:proprietary')
source=('TERMS')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://update.tabnine.com/bundles/$pkgver/x86_64-unknown-linux-musl/TabNine.zip")
source_i686=("$pkgname-$pkgver-i686.zip::https://update.tabnine.com/bundles/$pkgver/i686-unknown-linux-musl/TabNine.zip")
sha256sums=('77177f1e237c7139a241da39c9f7ef736e0c2677587e4a1fc4959097b93ba99e')
sha256sums_x86_64=('3a7f92a249b6f8157725b2302bca0f3baf3cd85396065812680a77540c91f913')
sha256sums_i686=('068ee1f0f676cd1a3edb718e8cc3ddf0ae2e82474a5cca88e9474b9b5469befa')

package() {
	install -D TabNine -t "$pkgdir/usr/bin/"
	ln -s /usr/bin/TabNine "$pkgdir/usr/bin/tabnine"
	install -Dm 644 TERMS -t "$pkgdir/usr/share/licenses/$pkgname/"
}
