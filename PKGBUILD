# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver=1.9.2
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/purdueLUG/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-future" "python-future" "python-pykeepass" "python-pygpgme" "python-colorama" "python-pyuserinput-git" "python-easypysmb")
source=("https://codeload.github.com/purdueLUG/passhole/tar.gz/v$pkgver")
sha512sums=('17fc4c77a8ac5eea289c0a2d094669d6c5869cac63f8d171f3a4c2c8549df133dda6134e3b6b06503dc79e93b79a51d2f49b41563f420b746eb33e7493c36526')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
