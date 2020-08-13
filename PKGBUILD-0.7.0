# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-version
pkgver=0.7.0
pkgrel=1
pkgdesc="A command line funtion for package version."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-version.git"
depends=('octetos-coreutils')
#backup=('etc/nanorc')
md5sums=('d60f5023dadb02a2e679ebc158547277')
source=(https://github.com/azaeldevel/octetos-version/archive/0.7.0-alpha.tar.gz)

build() {
    cd octetos-version-0.7.0-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-pacman
    make
}

package() {
  cd octetos-version-0.7.0-alpha
  make DESTDIR="${pkgdir}" install
}
