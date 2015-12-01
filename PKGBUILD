# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.644
pkgrel=3
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 
			'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string' 'perl-data-uniqid' 
			'perl-io-socket-inet6')
optdepends=('perl-ntlm' 'perl-test-pod')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('ce7061a310559acd8cad43cebe4883dd4daba12ca2d5b9dbb2f82fa3a766d097')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
