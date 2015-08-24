# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.644
pkgrel=2
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 
			'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string' 'perl-data-uniqid' 
			'perl-io-socket-inet6')
optdepends=('perl-ntlm' 'perl-test-pod')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('cdca8c91eba7e6b771d52e9092521c523ee5042ce669c6e126f3c2171029a74a')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
