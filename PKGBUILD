# Maintainer: Daniel Nikoloski <nikoloskid at pm dot me>
# Maintainer: Damian Barabonkov <dbctl at pm dot me
pkgname=proton-drive-sync-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Proton Drive sync client"
arch=('x86_64' 'aarch64')
url="https://github.com/DamianB-BitFlipper/proton-drive-sync"
license=('GPL-3.0')
depends=('libsecret')
provides=('proton-drive-sync')
conflicts=('proton-drive-sync')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v${pkgver}/proton-drive-sync-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v${pkgver}/proton-drive-sync-linux-arm64.tar.gz")
sha512sums_x86_64=('bbed1dfc7b8782a5445c17290bff7a8accb6a9c9e6a01ea77429d6ae4445a06855c350de28be8b73d4a74234fd9bbb8dcfa1d9d4f295ff201eb1d5fcdbb0c188')
sha512sums_aarch64=('551dc69182114dab08720e73e86e23ade8137f063cd646cc3428ce7890c984f07496f22ed4a56d1091bedf9b3295ed7988d9db15a86ea65caaf3b6b5f786a174')

package() {
    install -Dm755 "${srcdir}/proton-drive-sync" "${pkgdir}/usr/bin/proton-drive-sync"
}
