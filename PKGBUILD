# Maintainer: nicknb <nicknb at posteo dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

_name=dblab
pkgname=${_name}-bin
pkgver=0.42.1
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
provides=("${_name}")
conflicts=("${_name}")
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/danvergara/dblab"
source_x86_64=("${_name}_${pkgver}_${arch[0]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}_${pkgver}_${arch[1]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('dde795d25ca6f7f1c53fac812ebc38a05abfed78d9e04b039a706e6ac65e8d15')
sha256sums_aarch64=('3d370771b9b809aba51c1654895cdc7cbdd52b27cb99c59394e894fb7f6b74ab')

package() {
    install -Dm 0755 ${_name} ${pkgdir}/usr/bin/${_name}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
