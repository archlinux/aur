# Maintainer: xlwz <xlwzforever@outlook.com>

pkgname=keepass-plugin-onedrivesync
pkgver=2.1.2.1
pkgrel=1
pkgdesc="KeePass plugin to allows syncing of KeePass databases stored on OneDrive Personal, OneDrive for Business or SharePoint."
license=('EPL')
depends=('keepass')
provides=('keepassonedrivesync')
conflicts=('keepassonedrivesync')
arch=('any')
url="https://github.com/KoenZomers/KeePassOneDriveSync"
source=(https://github.com/KoenZomers/KeePassOneDriveSync/releases/download/$pkgver/KeeOneDriveSync.plgx)
sha256sums=('9f0585b43ebf69aaa24bb51a1c2f2a9cd6ad663ba852af86c99771eb537dd1a0')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeOneDriveSync.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
