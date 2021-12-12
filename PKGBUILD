# Maintainer: xlwz <xlwzforever@outlook.com>

pkgname=keepass-plugin-onedrivesync
pkgver=2.1.2.2
pkgrel=1
pkgdesc="KeePass plugin to allows syncing of KeePass databases stored on OneDrive Personal, OneDrive for Business or SharePoint."
license=('EPL')
depends=('keepass')
provides=('keepassonedrivesync')
conflicts=('keepassonedrivesync')
arch=('any')
url="https://github.com/KoenZomers/KeePassOneDriveSync"
source=(https://github.com/KoenZomers/KeePassOneDriveSync/releases/download/$pkgver/KeeOneDriveSync.plgx)
sha256sums=('1e5e88020a9786873d20fdb0b3de4f560cad8d28760527a93d266ead54889f4d')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeOneDriveSync.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
