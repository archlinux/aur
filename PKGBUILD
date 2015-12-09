# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.670
pkgrel=1
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 
			'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string' 'perl-data-uniqid' 
			'perl-io-socket-inet6')
optdepends=('perl-ntlm' 'perl-test-pod')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('0a02a60899850a2aa8b7642a1caebda951437e2eb530f32489b10e651e957a29')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
