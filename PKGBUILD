# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="sejda-console"
pkgver=3.2.85
pkgrel=3
pkgdesc="Shell interface for performing pdf manipulations"
arch=('x86_64')
url="www.sejda.org"
license=('AGPL3')
depends=('jre-openjdk-headless>=1.8')
source=("$pkgname-$pkgver.zip::https://github.com/torakiki/sejda/releases/download/v$pkgver/$pkgname-$pkgver-bin.zip")
b2sums=('fea4d2b75c2b4804d0e1b96b88608c60e2d83b34ef0a58361fd732c42f85939b8f459565244b197c2fd4d507ca973e32488069a4918294a13e633b06f367b7dd')

package() {
	mkdir $pkgdir/opt
	cp -r $pkgname-$pkgver $pkgdir/opt/sejda-console/
	mkdir -p $pkgdir/usr/bin
	ln -s $pkgdir/opt/sejda-console/bin/sejda-console  $pkgdir/usr/bin/
}
