# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
_realname=python-balanceboard
pkgname=$_realname-git
pkgver=1
pkgrel=1
pkgdesc="Python bindings for the Wii Balance Board"
arch=('i686' 'x86_64')
url="https://github.com/lubosz/python-balanceboard"
license=('GPLv3')
depends=('python>=3.0' 'cython' 'wiic-svn')
source=("git+https://github.com/lubosz/$_realname.git")
md5sums=('SKIP')
 
package() {
  cd $_realname
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
