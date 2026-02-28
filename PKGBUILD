# Maintainer: dbctl@pm.me
pkgname=proton-drive-sync-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Sync local directories to Proton Drive cloud storage'
arch=('x86_64' 'aarch64')
url='https://github.com/DamianB-BitFlipper/proton-drive-sync'
license=('GPL-3.0-only')
depends=('libsecret')
provides=('proton-drive-sync')
conflicts=('proton-drive-sync' 'proton-drive-sync-bin')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.3/proton-drive-sync-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.3/proton-drive-sync-linux-arm64.tar.gz")
sha256sums_x86_64=('00a241e8fdc7b757c3a0b8a06b6d7dce6039618f09a2301af705a99330532a08')
sha256sums_aarch64=('537457b27a96c7ff8af9ac58a8d256fb7b27f1442babbdc46318bd669d6b4cad')

package() {
    install -Dm755 proton-drive-sync "${pkgdir}/usr/bin/proton-drive-sync"
}
