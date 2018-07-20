# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=e_dbus
pkgver=1.7.10
pkgrel=1
pkgdesc="EFL Wrapper for DBus"
arch=('x86_64')
url="http://www.enlightenment.org/"
license=('BSD')
depends=('efl' 'libdbus')
source=("https://download.enlightenment.org/att/releases/e_dbus-1.7.10.tar.bz2")
sha256sums=('b93f778a4bf50ce044b4798e08a03f62e9b890c47305f9d5839989481f38ddd4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
