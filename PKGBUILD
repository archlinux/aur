# Maintainer: Keith Scroggs <very-amused@pm.me>
pkgname='my_timers'
pkgver=0.2.0
pkgrel=1
pkgdesc='Multithreaded MariaDB/MySQL event runner designed to serve as an improved event_scheduler.'
arch=('x86_64')
url='https://github.com/very-amused/my_timers'
license=('MIT')

depends=('openssl>=3.0.7')
makedepends=('make>=4.3')
optdepends=('mariadb: database server (recommended)'
            'mysql: database server')
source=("https://github.com/very-amused/my_timers/releases/download/v$pkgver/x86_64-linux.tar.gz")
sha256sums=('acd63e57b5e1eadfd647fdf80227d1afd6bd47156f242662e380225e1c27fb3f')

package() {
  cd "release/x86_64-linux"
  make DESTDIR=$pkgdir PREFIX=/usr install
}
