# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=pacsource
pkgver=0.1.1
pkgrel=1
pkgdesc="A Bash CLI tool for downloading, updating, building, and installing official Arch Linux package sources"
arch=('any')
url="https://github.com/user14923929/pacsource"
license=('GPL-3.0-only')
depends=('bash' 'git' 'curl' 'pacman' 'base-devel')
source=(""${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"")
sha256sums=('3a9ac09802c6309fdcdf0af5e622f08ee6be9ba320a3ff90bb501251c26c1caa')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
