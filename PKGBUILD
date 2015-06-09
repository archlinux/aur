# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-imaplib2
_pkgname=imaplib2
pkgver=2.43
_pkgcommit=6170b7d63f0859330eb8511e2e296d02f51aad58
pkgrel=2
pkgdesc="Python IMAP4rev1 mail protocol client class using threads for parallel operation."
arch=('any')
url="http://imaplib2.sourceforge.net/"
license=('Python')
depends=('python')
source=("https://github.com/bcoe/$pkgname/archive/$_pkgcommit.zip")
md5sums=('e4013c613598be9d6545c780cc0c3366')

build() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py install --root="$pkgdir/" --optimize=1
}
