# Maintainer: Jakub Fišer <reverse zc.uresifu@abuk>
_pkgname=pwdhash
pkgname=$_pkgname-git
pkgver=2015.01.28.857a44b
pkgrel=1
pkgdesc="Site-specific password generator"
arch=('any')
url='https://github.com/abbot/pwdhash'
license=('BSD')
depends=('python2' 'python2-setuptools')
makedepends=('git')
source=( "git+https://github.com/abbot/pwdhash")
md5sums=("SKIP")

package()
{
  cd "$srcdir/$_pkgname" || return 1
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
