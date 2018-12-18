# Maintaner: jskier <jay@jskier.com>
# Contributor: jskier <jay @jskier.com>
pkgname=python-keeper-commander-git
pkgver=2.10
pkgrel=1
#epoch=1
pkgdesc="Module provides SDK for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python' 'python3-asciitree-git' 'python-prompt_toolkit' 
         'python-tabulate' 'python-requests' 'python-pycryptodomex' 'python-colorama')
source=("git+https://github.com/Keeper-Security/Commander.git")
sha512sums=('SKIP')

package() {
  cd "$srcdir/Commander"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
