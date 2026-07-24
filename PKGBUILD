# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=pacsource
pkgver=0.1.0
pkgrel=2
pkgdesc="A Bash CLI tool for downloading, updating, building, and installing official Arch Linux package sources"
arch=('any')
url="https://github.com/user14923929/pacsource"
license=('GPL-3.0-only')
depends=('bash' 'git' 'curl' 'pacman' 'base-devel')
source=(""${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"")
sha256sums=('b87dd6665b22c7c87e634c3f8f7fa6ac48e7b5f7d325cf53bc9e2c02642cc5f8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
