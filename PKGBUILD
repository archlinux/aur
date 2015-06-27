# Maintainer: alexiobash <me @ alexiobash.com>

pkgname=conky-top
pkgver=1.7
pkgrel=2
pkgdesc="A Top conky-lua for ArchLinux"
arch=('any')
url="http://alexiobash.com/conky-top-monitor-di-sistema-a-pannello/"
license=('GPL')
depends=('conky-lua' 'perl-mail-imapclient' 'perl-io-socket-ssl' 'git')
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')
backup=('etc/conky/conky-top.conf' 'usr/share/conkytop/gmail.pl' 'usr/share/conkytop/update.pl' )

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}


