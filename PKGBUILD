# Maintainer: dbctl@pm.me
pkgname=proton-drive-sync-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Sync local directories to Proton Drive cloud storage'
arch=('x86_64' 'aarch64')
url='https://github.com/DamianB-BitFlipper/proton-drive-sync'
license=('GPL-3.0-only')
depends=('libsecret')
provides=('proton-drive-sync')
conflicts=('proton-drive-sync' 'proton-drive-sync-bin')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.4/proton-drive-sync-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.4/proton-drive-sync-linux-arm64.tar.gz")
sha256sums_x86_64=('c73ae43648d6ff710de83b9477e1df9628d7b7ad601245c37bec361228301994')
sha256sums_aarch64=('40ed3dbe5ccd7513c7c02068dab27e17c765abffe34b5c21417fe2b1838a3bcf')

package() {
    install -Dm755 proton-drive-sync "${pkgdir}/usr/bin/proton-drive-sync"
}
