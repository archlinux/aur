# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tabnine
pkgver=3.7.17
pkgrel=1
pkgdesc="AI-powered autocompletion engine"
arch=('x86_64' 'i686')
url="https://tabnine.com"
license=('custom:proprietary')
source=('TERMS')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://update.tabnine.com/bundles/$pkgver/x86_64-unknown-linux-musl/TabNine.zip")
source_i686=("$pkgname-$pkgver-i686.zip::https://update.tabnine.com/bundles/$pkgver/i686-unknown-linux-musl/TabNine.zip")
sha256sums=('77177f1e237c7139a241da39c9f7ef736e0c2677587e4a1fc4959097b93ba99e')
sha256sums_x86_64=('b7ac9f89154f723fe03f13a1d37a5e974b1940961466f081c479b1184db5e20b')
sha256sums_i686=('77c8942dba5e3b1a19879761beca47929a931f747b32022b7e1d3d0079c04f8d')

package() {
	install -D TabNine -t "$pkgdir/usr/bin/"
	ln -s /usr/bin/TabNine "$pkgdir/usr/bin/tabnine"
	install -Dm 644 TERMS -t "$pkgdir/usr/share/licenses/$pkgname/"
}
