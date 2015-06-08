# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=lua-linenoise
pkgver=0.8
pkgrel=1
pkgdesc='Lua bindings for linenoise.'
arch=('x86_64' 'i686')
url='https://github.com/hoelzro/lua-linenoise'
license=('MIT/X11')
depends=('lua' 'luarocks')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hoelzro/lua-linenoise/archive/${pkgver}.tar.gz")
sha256sums=('6f0b619aec381ef40d433abd13f983cfe504a21caa4e6aa5b46de2bfa5780002')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    luarocks make --to="${pkgdir}/usr"

    rm "${pkgdir}/usr/lib/luarocks/rocks-5.3/manifest"
}

