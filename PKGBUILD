# Contributor: https://github.com/jerry3904 
# Maintainer: https://github.com/luffah
# Last Modified 2024-02-20 by Martin Filion <Mordillo98@gmail.com>

pkgname=obkey-python3
pkg_git=obkey
pkgver=1.3.2
pkgrel=1
pkgdesc="graphical tool for configuring Openbox keybindings"
arch=('i686' 'x86_64')
url="https://github.com/MX-Linux/obkey"
license=('GPL3')
depends=('python' 'python-gobject' 'python-gettext')
conflicts=('obkey' 'obkey-git')
source=("git+https://github.com/MX-Linux/obkey.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkg_git}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
