# Maintainer: nicknb <nicknb at posteo dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

_name=dblab
pkgname=${_name}-bin
pkgver=0.50.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
provides=("${_name}")
conflicts=("${_name}")
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/danvergara/dblab"
source_x86_64=("${_name}_${pkgver}_${arch[0]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}_${pkgver}_${arch[1]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6f8ae24bda660254a357dbfc135bb3d2b8bad2b413554aa13f3dfd4750216e71')
sha256sums_aarch64=('e64faec296abe3c3261e61797080c9afff61fa69f6bceab0c7536658ee78b01c')

package() {
    install -Dm 0755 ${_name} ${pkgdir}/usr/bin/${_name}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
