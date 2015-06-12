pkgname=imapdedup
pkgver=20130617
pkgrel=1
pkgdesc="IMAP folder deduplicator"
arch=(any)
url="https://github.com/quentinsf/IMAPdedup"
license=('GPL2')
depends=('python2')
source=(git://github.com/quentinsf/IMAPdedup.git)
md5sums=('SKIP')

package() {
  cd "$srcdir/IMAPdedup"
  install -Dm0755 imapdedup.py $pkgdir/usr/bin/imapdedup
  install -Dm0755 README.txt $pkgdir/usr/share/doc/imapdedup/README.txt
}
