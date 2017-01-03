# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-imaplib2
_pkgname=imaplib2
pkgver=2.48
_pkgcommit=1cb4037da8825d9fb9bd3d15cc567571c9b3e9aa
pkgrel=1
pkgdesc="Python IMAP4rev1 mail protocol client class using threads for parallel operation."
arch=('any')
url="http://imaplib2.sourceforge.net/"
license=('Python')
depends=('python-setuptools')
source=("https://github.com/bcoe/imaplib2/archive/$_pkgcommit.zip")
md5sums=('b0cce3a92b73fcd5b1fca788f9ae1ead')

build() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgcommit"
  python setup.py install --root="$pkgdir/" --optimize=1
}
