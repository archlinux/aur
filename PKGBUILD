# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=lua-multipart-post
pkgver=1.1
pkgrel=1
pkgdesc="HTTP Multipart Post helper for lua"
arch=('i686' 'x86_64')
url="https://github.com/catwell/${pkgname}"
license=('MIT')
depends=('lua-socket')
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0e032ddaa4debe3d33dce635281a64882fd871084747071e4323f3848073d3bd')
_luaver=$(lua -v | grep -o '[0-9]\.[0-9]')

package() {
  mkdir -p "${pkgdir}/usr/share/lua/${_luaver}"
  cp "${srcdir}/${pkgname}-${pkgver}/multipart-post.lua" "${pkgdir}/usr/share/lua/${_luaver}"
}

