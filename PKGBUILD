# Maintainer: nicknb <nicknb at posteo dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

_name=dblab
pkgname=${_name}-bin
pkgver=0.40.1
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
provides=("${_name}")
conflicts=("${_name}")
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/danvergara/dblab"
source_x86_64=("${_name}_${pkgver}_${arch[0]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}_${pkgver}_${arch[1]}.tgz::${url}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('12745d09ca091f4478ef254c33349b24e1c553328dc41741b8a7960494ad6da2')
sha256sums_aarch64=('ae27852bf04a0e2ce4016a3c6c5dd0e21e3b8a3863a19ded01956e269b64e509')

package() {
    install -Dm 0755 ${_name} ${pkgdir}/usr/bin/${_name}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
