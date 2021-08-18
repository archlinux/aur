# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=Old-Style-inDark-Extend
_pkgname2=Old-Style-inDark-Slim
_pkgname3=Old-Style-inDark
pkgname=plank-theme-old-style-indark
pkgver=1.0.1
pkgrel=1
pkgdesc='Collections of Old-Style-InDark Plank Themes'
arch=(any)
url='https://www.pling.com/p/1345008/'
_url="https://github.com/MMcQueenGNU"
license=('CC-BY-SA')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('af0092305cf3d1f07b9065706e3e5126dea0cd3c3e99a9d4f6b280d8d8394f75')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname2
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname3
	cd "$srcdir/$pkgname-$pkgver/$_pkgname"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname2"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname2/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname3"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname3/
}

