# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgbase=lua-multipart-post
pkgname=("lua-multipart-post")
pkgver=1.4
pkgrel=1
pkgdesc="HTTP Multipart Post helper for lua"
arch=('i686' 'x86_64')
url="https://github.com/catwell/${pkgname}"
license=('MIT')
depends=('lua-socket')
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1773605b024de287597fb253c82a22a06c64b9b417a9cf8726f64e0de7daeb99')
_luaver=$(lua -v | grep -o '[0-9]\.[0-9]')

package_lua-multipart-post() {
  mkdir -p "${pkgdir}/usr/share/lua/${_luaver}"
  cp "${srcdir}/${pkgbase}-${pkgver}/multipart-post.lua" "${pkgdir}/usr/share/lua/${_luaver}"
}
