# Maintainer: Oliver Graute <oliver.graute@gmail.com>
pkgname=tk-brief
pkgver=5.9 # note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgrel=1
pkgdesc="GUI for easily writing letters with LaTeX"
arch=(i686 x86_64)
url="http://http.debian.net/debian/pool/main/t/tk-brief/tk-brief_5.9-1.1.tar.gz"
license=('GPLv2')
groups=('')
provides=('')
depends=('tk')
makedepends=('')
conflicts=('')
replaces=('')
backup=('')
install=''
source=(http://http.debian.net/debian/pool/main/t/tk-brief/tk-brief_5.9-1.1.tar.gz)
md5sums=('ec7fffeec95eedea5f918a9757ea537c')

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/doc/tk-brief/
	mkdir -p $pkgdir/usr/share/man/
	mkdir -p $pkgdir/usr/share/man/de/man1/
	mkdir -p $pkgdir/usr/share/man/man1
	mkdir -p $pkgdir/usr/share/menu
	cp "$srcdir/$pkgname-$pkgver/tk_Brief" "$pkgdir/usr/bin/tk-brief"
	cp "$srcdir/$pkgname-$pkgver/debian/copyright" "$pkgdir/usr/share/doc/tk-brief/copyright"
	cp "$srcdir/$pkgname-$pkgver/debian/changelog" "$pkgdir/usr/share/doc/tk-brief/changelog"
	cp "$srcdir/$pkgname-$pkgver/dante-article_german.ps.gz" "$pkgdir/usr/share/doc/tk-brief/dante-article_german.ps.gz"
	cp "$srcdir/$pkgname-$pkgver/tk_Brief.1" "$pkgdir/usr/share/man/de/tk_Brief.1"
	cp "$srcdir/$pkgname-$pkgver/tk_Brief-en.1" "$pkgdir/usr/share/man/man1/tk_Brief-en.1"
	cp "$srcdir/$pkgname-$pkgver/tk_Brief" "$pkgdir/usr/share/menu"
	chmod +x $pkgdir/usr/bin/tk-brief
}


