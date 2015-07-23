# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.637
pkgrel=1
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 
			'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string' 'perl-ntlm' 
			'perl-data-uniqid' 'perl-io-socket-inet6')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('8d3e143f20ca306ef7303fc382ad2406b73136ce1e8758d1b9934314acc71b23')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
