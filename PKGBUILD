pkgname=perl-www-telegram-botapi
pkgver=0.12
pkgrel=1
pkgdesc='Perl implementation of the Telegram Bot API'
url=https://github.com/Robertof/perl-www-telegram-botapi
arch=(any)
depends=( perl perl-json-maybexs perl-encode perl-libwww perl-carp )
optdepends=('perl-mojolicious: asynchronous mode')
source=('https://github.com/Robertof/perl-www-telegram-botapi/archive/refs/tags/v0.12.tar.gz')
md5sums=('7d0ab5b0626a1261c5d0082c03962ef8')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	perl Makefile.PL
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir"
}
