# Maintainer: zoe

pkgname="keepass-plugin-dbbackup"
pkgver=2.0.8.6
pkgrel=2
pkgdesc="Creates backups of modified databases"
arch=("any")
url="http://keepass.info/plugins.html#databasebackup"
license=("GPLv2")
depends=('keepass>=2.27')
source=("http://keepass.info/extensions/v2/databasebackup/DataBaseBackup-$pkgver.zip")
md5sums=('69b8e7d8e76cbe1088f7630d202b250c')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -m644 dbBackup.plgx "${pkgdir}"/usr/share/keepass/plugins/

}

# vim:set ts=2 sw=2 et:
