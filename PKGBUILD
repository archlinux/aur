# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-imaplib2
_pkgname=imaplib2
pkgver=2.57
_pkgcommit=3e87a66750b4fe79ffafdb1cce8509801720d125
pkgrel=1
pkgdesc="Python IMAP4rev1 mail protocol client class using threads for parallel operation"
arch=('any')
url="https://github.com/imaplib2/imaplib2"
license=('Python')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=(git+https://github.com/${_pkgname}/${_pkgname}.git#commit=${_pkgcommit})
md5sums=('SKIP')


build() {
  cd "$_pkgname"
  python2 setup.py build
}

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
