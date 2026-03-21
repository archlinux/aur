# Maintainer: goshitsarch <gosh@goshapps.com>

pkgname=gosh-github-backup-manager-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A native desktop app for backing up your GitHub repositories"
arch=('x86_64')
url="https://github.com/goshitsarch-eng/Gosh-Github-Backup-Manager"
license=('AGPL-3.0-only')
depends=('openssl' 'gcc-libs')
provides=('gosh-github-backup-manager')
conflicts=('gosh-github-backup-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/goshitsarch-eng/Gosh-Github-Backup-Manager/releases/download/v${pkgver}/Gosh-GitHub-Backup-Manager-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('1cb90a448bf6ef68d7d33c18fabbe8ddf2b5396a3f6dc5222560d96cc29af6e9')

package() {
    cd "${srcdir}/gosh-github-backup-manager"
    install -Dm755 gosh-github-backup-manager "${pkgdir}/usr/bin/gosh-github-backup-manager"
    install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.goshitsarch-eng.gosh-github-backup-manager.png"
    install -Dm644 com.goshitsarch-eng.gosh-github-backup-manager.desktop "${pkgdir}/usr/share/applications/com.goshitsarch-eng.gosh-github-backup-manager.desktop"
}
