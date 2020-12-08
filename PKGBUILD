# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Based on https://aur.archlinux.org/packages/python2-fancycompleter
pkgname=python-fancycompleter
_realname=fancycompleter
pkgver=0.9.0
pkgrel=2
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://github.com/pdbpp/fancycompleter"
license=('BSD')
depends=('python')
# pyrepl is optional, and non-git version buggy on py3.
optdepends=('python-pyrepl-git')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/f/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('bcef3de6b10b25c6a9fd2ea5bd40d716')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
