# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: meanlint <meanlint@outlook.com>

pkgname=metacubexd-bin
_pkgname=metacubexd
pkgver=1.134.0
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
sha256sums=('5f1d9445e500c478380ab2aa1acf6f1a6591b28b091353aa9d84a6a76c0e0bd3')

package() {
    cd "${srcdir}"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
