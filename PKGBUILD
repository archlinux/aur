# Maintainer: nicknb <nicknb at posteo dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

_name=dblab
pkgname=${_name}-bin
pkgver=0.55.2
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
provides=("${_name}")
conflicts=("${_name}")
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/danvergara/dblab"
source_x86_64=("${_name}_${pkgver}_${arch[0]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}_${pkgver}_${arch[1]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('298b1a9f43e14bc469b9377f23f822b88c94388c15fca241487ca3efb34a0662')
sha256sums_aarch64=('d47e18d1b951013ee9475201162153f7045e11aaf3541efcce561029750b3af5')

package() {
    install -Dm 0755 ${_name} ${pkgdir}/usr/bin/${_name}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
