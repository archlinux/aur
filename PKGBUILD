# Maintainer: meanlint <meanlint@outlook.com>

pkgname=metacubexd-bin
_pkgname=metacubexd
pkgver=1.100.1
pkgrel=1
pkgdesc='Clash.Meta Dashboard, The Official One, XD'
arch=('any')
_repo="MetaCubeX/${_pkgname}"
url="https://github.com/${_repo}"
license=('MIT')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform'
            'clash-meta: Another Clash Kernel by MetaCubeX')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/MetaCubeX/metacubexd/releases/download/v${pkgver}/dist.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/
    find . -type d -exec install -vd "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
    find . -type f -exec install -vm 644 {} "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
}

