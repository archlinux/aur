#Contributor: Xavier Vierling <xavierling@free.fr>
pkgname=nzbperl
pkgver=0.6.8
pkgrel=1
pkgdesc="nzb based nntp/usenet downloader in perl"
arch=('i686' 'x86_64')
url="http://noisybox.net/computers/nzbperl/"
license="GPL"
depends=(perl-term-readkey perl-xml-dom uudeview)
source=(http://noisybox.net/computers/nzbperl/$pkgname-$pkgver.pl)
md5sums=('70e64b7cd4ff9c7c098bf8dffeb62578')

build() {
	cd $startdir/src
	install -D nzbperl-$pkgver.pl $startdir/pkg/usr/bin/nzbperl
}