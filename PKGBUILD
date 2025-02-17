pkgname=imapdedup
pkgver=20250101
pkgrel=1
_commit=55508e17f771f5bde6957295b40b658e1447820d
pkgdesc="IMAP folder deduplicator"
arch=(any)
url="https://github.com/quentinsf/IMAPdedup"
license=('GPL2')
depends=('python')
makedepends=('git')
source=("git+https://github.com/quentinsf/IMAPdedup.git#commit=${_commit}")
md5sums=('SKIP')

package() {
  cd "$srcdir/IMAPdedup"
  install -Dm0755 src/imapdedup/imapdedup.py $pkgdir/usr/bin/imapdedup
  install -Dm0755 README.md $pkgdir/usr/share/doc/imapdedup/README.md
}
