# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-postorius')
_pkgbase=postorius
_commit=3d2b22974176126286047d511e7ecba25c54ed2c
pkgver=1.0.1
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
depends=('python2' 'python2-django' 'python2-django-browserid' 
         'python2-mailmanclient' 'python2-httplib2')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/postorius/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('9d942d8208e914c2b6a68034e1b534adecb892c7b507e6d4f39b40c8bf8389af')

package() {
  cd "$srcdir/$_pkgbase-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
