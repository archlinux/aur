# Maintainer: Martin -nexus- Mlynář <nexus+arch@smoula.net>
pkgname=python-btrfs-sxbackup
pkgver=0.5.8
pkgrel=2
pkgdesc="Btrfs snapshot backup utility"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/btrfs-sxbackup"
license=('GPL')
depends=(
	'btrfs-progs'
	'python-setuptools'
)
source=(http://pypi.python.org/packages/source/b/btrfs-sxbackup/btrfs-sxbackup-${pkgver}.tar.gz)
md5sums=('22688774801bbc651e4440aa23b17607')

package() {
  cd $srcdir/btrfs-sxbackup-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}
