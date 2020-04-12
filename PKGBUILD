# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=lua-multipart-post
pkgver=1.2
pkgrel=1
pkgdesc="HTTP Multipart Post helper for lua"
arch=('i686' 'x86_64')
url="https://github.com/catwell/${pkgname}"
license=('MIT')
depends=('lua-socket')
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('90eaf2de28258b87780efe2aabdbbe1913f0b9d420f90b5540dd360968d56ac9')
_luaver=$(lua -v | grep -o '[0-9]\.[0-9]')

package() {
  mkdir -p "${pkgdir}/usr/share/lua/${_luaver}"
  cp "${srcdir}/${pkgname}-${pkgver}/multipart-post.lua" "${pkgdir}/usr/share/lua/${_luaver}"
}

