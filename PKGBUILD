# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=heidisql
pkgname=${_basename}-bin
pkgver=12.13.1.1
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'glib2' 'pango' 'gtk2' 'cairo' 'bash' 'gdk-pixbuf2' 'libx11' 'at-spi2-core' 'libperconaserverclient' 'mariadb-libs' 'postgresql-libs' 'sqlite')
source_x86_64=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('ff6381d9ec4e66c7c02a59bda9f24b35817bd31129152ed7f861414b4514f2c5')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
