# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=mybrowse
pkgver=0.3.1
pkgrel=2
pkgdesc="A simple WebKit browser written in Python3 and using GTK3"
arch=('any')
url="https://github.com/KaiserBarbarossa/MyBrowse"
license=('GPL3')
depends=('webkit2gtk' 'python' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KaiserBarbarossa/mybrowse/archive/v$pkgver.tar.gz")
sha256sums=('7eb8fef53359d2243400257ca542fa174e69df6543c2342e3aba3bfe49a7eda1')


package() {
	cd "MyBrowse-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	install -Dm755 mybrowse $pkgdir/usr/bin
	install -Dm644 mybrowse.desktop $pkgdir/usr/share/applications
}
