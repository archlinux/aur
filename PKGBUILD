pkgname=imaputils
pkgver=0.2
pkgrel=1
pkgdesc="perl script for managing/searching mail on an IMAP servers from the command line"
arch=(any)
url="https://sourceforge.net/projects/imaputils/files/"
license=('BSD')
depends=('perl-mail-imapclient')
source=(http://downloads.sourceforge.net/project/imaputils/imaputils.v-$pkgver.tar.bz2)
md5sums=('8aa425fa30ecceda37d0096a84ca4201')

package() {
	cd "$pkgname.v-$pkgver"
	install -Dm0755 imaputils.pl $pkgdir/usr/bin/imaputils.pl
	install -Dm0644 README $pkgdir/usr/share/doc/$pkgname/README
}
