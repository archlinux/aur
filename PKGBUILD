# Maintainer: dbctl@pm.me
pkgname=proton-drive-sync-prerelease-bin
pkgver=0.2.2beta.2
pkgrel=1
pkgdesc='Sync local directories to Proton Drive cloud storage (prerelease)'
arch=('x86_64' 'aarch64')
url='https://github.com/DamianB-BitFlipper/proton-drive-sync'
license=('GPL-3.0-only')
depends=('libsecret')
provides=('proton-drive-sync')
conflicts=('proton-drive-sync' 'proton-drive-sync-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.2-beta.2/proton-drive-sync-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.2-beta.2/proton-drive-sync-linux-arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
package() {
    install -Dm755 proton-drive-sync "${pkgdir}/usr/bin/proton-drive-sync"
}
