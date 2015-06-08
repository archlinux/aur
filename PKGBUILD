# Contributor: FJ <joostef@gmail.com>
pkgname=eqe
pkgver=1.3.0
pkgrel=2
pkgdesc="Linux LaTeX equation editor."
arch=('any')
license=('GPL2')
url="http://rlehy.free.fr/"
depends=('gtk2-perl' 'imagemagick' 'tetex' 'perl-file-slurp' 'perl-template-toolkit')
source="http://rlehy.free.fr/$pkgname-$pkgver.tar.bz2"
md5sums=('74b27a201302ea33033d9ccb496e1e34')

build() {
  cd $startdir/src/eqe-$pkgver
  make DESTDIR=$pkgdir PREFIX=usr install || return 1 
}
