# Maintainer: nicknb <nicknb at posteo dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

_name=dblab
pkgname=${_name}-bin
pkgver=0.40.2
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
provides=("${_name}")
conflicts=("${_name}")
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/danvergara/dblab"
source_x86_64=("${_name}_${pkgver}_${arch[0]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}_${pkgver}_${arch[1]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5672260f7230cda2a8a464480d80a5c08fba5e48ccc637cd709ade2c19bd1509')
sha256sums_aarch64=('516487b248472edac79bd3a0c6a5b3a78a4bbef5990876bb4b9a1176c3252b1b')

package() {
    install -Dm 0755 ${_name} ${pkgdir}/usr/bin/${_name}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
