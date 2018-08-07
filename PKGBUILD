# Submitter: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver=1.5.0
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/purdueLUG/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-future" "python-future" "python-pykeepass" "python-pygpgme" "python-colorama" "python-pyuserinput-git" "python-easypysmb")
source=("https://codeload.github.com/purdueLUG/passhole/tar.gz/v$pkgver")
md5sums=('322c2c5222eac851a5b2ad65f94ae337')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
