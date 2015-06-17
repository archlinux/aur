# Mantainer: M0Rf30
pkgname=clonezilla-experimental
_name=clonezilla
pkgver=3.10.2
pkgrel=1
pkgdesc="The Free and Open Source Software for Disk Imaging and Cloning"
arch=('i686' 'x86_64')
url="http://clonezilla.org/"
license=('GPL')
depends=('partclone' 'ntfsprogs' 'coreutils' 'partimage' 'drbl-experimental' 'pigz' 'sshfs')
provides=('clonezilla')
source=(http://free.nchc.org.tw/drbl-core/src/unstable/$_name-$pkgver.tar.bz2)

package() {
  cd $srcdir/$_name-$pkgver
  make DESTDIR=$pkgdir install  
}

md5sums=('48ade9bbee5a86fbeae61705955a2edf')
