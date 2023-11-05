# Maintainer: Keith Scroggs <very-amused@pm.me>
pkgname='my_timers'
pkgver=0.2.2
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
sha256sums=('eb2efca31caa324262f4bb51ead12a8e3d9c7c84c2c45f2ac7efd272d4766bb6')

package() {
  cd "release/x86_64-linux"
  make DESTDIR=$pkgdir PREFIX=/usr install
}
