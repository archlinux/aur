# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=SimpleDatabaseBackup
pkgname=keepass-plugin-simpledatabasebackup
pkgver=1.0.8
pkgrel=1
pkgdesc="Create a backup for every opened KeePass database every time a database with changes is saved"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/jnko/SimpleDatabaseBackup"
source=("https://github.com/jnko/SimpleDatabaseBackup/raw/master/${_pkgname}.plgx")
sha512sums=('e6dd58aae276becae1ee18a8208dfd85e53eb88a7ccb17aa0ae1d0c0f71950785f1ff4b480d69b0147d73802cd90ab29d64739aa53ed6b65297f35fadf518019')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
