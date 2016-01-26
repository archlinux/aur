# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.678
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
sha256sums=('77cd7b58bc1872bcf6c531ee8f764dda87e0dec3f6ffed752748ff9ae74534b0')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
