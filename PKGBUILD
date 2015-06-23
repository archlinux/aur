# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Mike Lenzen <lenzenmi at gmail dot com>
pkgname=python-btrsnap
pkgver=2.0.0
pkgrel=1
pkgdesc="A command-line tool to simplify working with timestamped btrfs snapshots" 
arch=('any')
url="https://github.com/lenzenmi/btrsnap"
license=('GPL3')
depends=('python' 'btrfs-progs' 'python-dateutil')
source=("https://github.com/lenzenmi/${pkgname##python-}/archive/$pkgver.tar.gz")
md5sums=('579d7c55d6747bdd29214515c8eeb786')

package() {
  cd "$srcdir/${pkgname##python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}



# vim:set ts=2 sw=2 et:
