# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-imaplib2
_pkgname=imaplib2
pkgver=2.45
_pkgcommit=29f6b55b9e0cdcda6cc922cef07fa58572e8816b
pkgrel=1
pkgdesc="Python IMAP4rev1 mail protocol client class using threads for parallel operation."
arch=('any')
url="http://imaplib2.sourceforge.net/"
license=('Python')
depends=('python')
source=("https://github.com/bcoe/imaplib2/archive/$_pkgcommit.zip")
md5sums=('5581ae977b3f7b424f03f43daf5c5019')

build() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py install --root="$pkgdir/" --optimize=1
}
