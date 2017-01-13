# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=SimpleDatabaseBackup
pkgname=keepass-plugin-simpledatabasebackup
pkgver=1.0.6
pkgrel=1
pkgdesc="Create a backup for every opened KeePass database every time a database with changes is saved"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/jnko/SimpleDatabaseBackup"
source=("https://github.com/jnko/SimpleDatabaseBackup/raw/master/${_pkgname}.plgx")
sha512sums=('464d9eb604344f6eea1d5f59446c58c2fbd1fafea2c8b78876a40ec5b6cf6de731216557facbb07bf43932132f7e6495ee0387eb0067a6c02c377de1b9572b2e')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
