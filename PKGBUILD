# Maintainer: Philipp Joram <phijor AT t-online DOT de>

pkgname=python-wget
_hgname=$pkgname
_hgauthor=techtonik
_hgcommit=e19779610914
pkgver=3.2
pkgrel=1
pkgdesc="pure python download utility"
arch=(any)
url="http://bitbucket.org/$_hgauthor/$_hgname"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://bitbucket.org/$_hgauthor/$_hgname/get/$pkgver.tar.gz")
sha512sums=('83c1c929dbd61e822df405e3f8235a1caf7082c56963f3735cf02db6e42a2e615544c8c5537507d88f7d7e618991444ddbe66f6e0966f7171fe7f287b6ec27a6')

package() {
  cd "$srcdir/$_hgauthor-$_hgname-$_hgcommit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
