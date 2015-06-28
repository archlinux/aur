# Maintainer: Martin -nexus- Mlynář <nexus+arch@smoula.net>
pkgname=python-btrfs-sxbackup
pkgver=0.5.4
pkgrel=1
pkgdesc="Btrfs snapshot backup utility"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/btrfs-sxbackup"
license=('GPL')
depends=('btrfs-progs')
source=(http://pypi.python.org/packages/source/b/btrfs-sxbackup/btrfs-sxbackup-${pkgver}.tar.gz)
md5sums=('91001f9297a8ac5ca7a51a946d5b6895')

package() {
  cd $srcdir/btrfs-sxbackup-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}
