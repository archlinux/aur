# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.607
pkgrel=1
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string')
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tgz")
sha256sums=('784331cfa6cc391751dcdc5290eba5d50bf3ddbe9b213f072b413941a3fe4f2a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
