# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: meanlint <meanlint@outlook.com>

pkgname=metacubexd-bin
_pkgname=metacubexd
pkgver=1.135.1
pkgrel=1
pkgdesc='Clash.Meta Dashboard, The Official One, XD (Precompiled version)'
arch=('any')
url="https://github.com/MetaCubeX/metacubexd"
license=('MIT')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform'
            'clash-meta: Another Clash Kernel by MetaCubeX')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/compressed-dist.tgz")
sha256sums=('4fbaa4b18e9e62b4d2a444e88a81eab6d99253b08f44987c1c079bc68d979a98')

package() {
    cd "${srcdir}"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
