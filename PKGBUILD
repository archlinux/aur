# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=lua-multipart-post
pkgver=1.3
pkgrel=2
pkgdesc="HTTP Multipart Post helper for lua"
arch=('i686' 'x86_64')
url="https://github.com/catwell/${pkgname}"
license=('MIT')
depends=('lua-socket')
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('997c7d9876d7e1220670cec8587cfdb5b11c1e3b32e9742a6aa091ad1027e026')
_luaver=$(lua -v | grep -o '[0-9]\.[0-9]')

package() {
  mkdir -p "${pkgdir}/usr/share/lua/${_luaver}"
  cp "${srcdir}/${pkgname}-${pkgver}/multipart-post.lua" "${pkgdir}/usr/share/lua/${_luaver}"
}

