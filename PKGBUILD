# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Based on https://aur.archlinux.org/packages/python2-fancycompleter
pkgname=python-fancycompleter
_realname=fancycompleter
pkgver=0.8
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('BSD')
depends=('python')
# pyrepl is optional, and buggy on py3.
optdepends=('python-pyrepl-hg')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/f/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('50d29d8b1671f4bfb76dd3d3fa5e6fea')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
