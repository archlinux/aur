# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: meanlint <meanlint@outlook.com>

pkgname=metacubexd-bin
_pkgname=metacubexd
pkgver=1.133.1
pkgrel=2
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
sha256sums=('11bcd29549d58c82037262fc60a667271b72a35b0185d36c3be8fdbcaebc4b42')

package() {
    cd "${srcdir}"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
