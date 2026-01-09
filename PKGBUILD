# Maintainer: Daniel Nikoloski <nikoloskid@pm.me>
pkgname=proton-drive-sync-bin
pkgver=0.2.1
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
sha512sums_x86_64=('9c03de4fc292868b1ff3f19c6082f5521e36e1fc95b26957d537710150c80d26336961cabe540821b19d7a605cd360a84916c84e021d5f3575ecb57268764ae1')
sha512sums_aarch64=('1ac24b1b1259a44773539ee0da3c20080a41a31e19770a0cb0bcbefb95e2700d67b67d5c3a835f11f46dfc1eb3192a31e8d222f109cf6e62cc9d0dc82fd56aaf')

package() {
    install -Dm755 "${srcdir}/proton-drive-sync" "${pkgdir}/usr/bin/proton-drive-sync"
}
