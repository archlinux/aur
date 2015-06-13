# Maintainer: SanskritFritz (gmail)

pkgname=wmdf
pkgver=1.6
pkgrel=2
pkgdesc="Dockapp for monitoring disk space on partitions."
#url="http://dockapps.windowmaker.org/file.php/id/175"
url="http://web.archive.org/web/20121031043853/http://dockapps.windowmaker.org/file.php/id/175"
license="GPL"
#depends=('libxpm' 'net-snmp')
arch=('i686' 'x86_64')
#source=("http://dockapps.windowmaker.org/download.php/id/359/$pkgname-0.$pkgver.tar.gz")
source=("$pkgname-0.$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-0.$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-0.$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('159bf4bbf90eaffcf8db53d7e1e57a35')
