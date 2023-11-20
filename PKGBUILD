# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

pkgname=lua-json
pkgver=0.1.2
pkgrel=1
pkgdesc="Pure lua json library"
arch=('any')
url="https://github.com/rxi/json.lua"
license=('MIT')
depends=('lua')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a786a429adfd3b9034213b52b9a44de7ed99970f10cfb8bf5e7ff006577c3f58')

package() {
    cd ${srcdir}/json.lua-${pkgver}
    install -Dm644 ./json.lua ${pkgdir}/usr/share/lua/5.4/json.lua
    install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
