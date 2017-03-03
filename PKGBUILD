# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=SimpleDatabaseBackup
pkgname=keepass-plugin-simpledatabasebackup
pkgver=1.0.7
pkgrel=1
pkgdesc="Create a backup for every opened KeePass database every time a database with changes is saved"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/jnko/SimpleDatabaseBackup"
source=("https://github.com/jnko/SimpleDatabaseBackup/raw/master/${_pkgname}.plgx")
sha512sums=('1685dc21089e55b6794d26f7882406e038d829219889a86318881ad41c0d6cc2c644e49a17d817fd1e0e5d3e6ab2ef6020b50776e3a5edb694140fa7cb3e7e62')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
