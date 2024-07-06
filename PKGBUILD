pkgname=imapdedup
pkgver=20240131
pkgrel=1
pkgdesc="IMAP folder deduplicator"
arch=(any)
url="https://github.com/quentinsf/IMAPdedup"
license=('GPL2')
depends=('python')
makedepends=('git')
source=("git+https://github.com/quentinsf/IMAPdedup.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/IMAPdedup"
  install -Dm0755 imapdedup.py $pkgdir/usr/bin/imapdedup
  install -Dm0755 README.md $pkgdir/usr/share/doc/imapdedup/README.md
}
