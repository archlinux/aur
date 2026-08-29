# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-bin
# Replaced by the release workflow before publishing to AUR.
pkgver=0.6.1
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('MIT' 'Apache-2.0')
provides=("sculk=${pkgver}" "sculk-cli=${pkgver}")
conflicts=('sculk' 'sculk-git' 'sculk-cli-bin' 'sculk-cli-git')
replaces=('sculk-cli-bin')
source=("sculk-${pkgver}::${url}/releases/download/v${_releasever}/sculk-linux-amd64")
sha256sums=('b8acc20ba3740197ec8c10d67dc985bc5e2b4712fb1591657c22eb9630e3b54c')

package() {
    install -Dm755 "${srcdir}/sculk-${pkgver}" "${pkgdir}/usr/bin/sculk"
}
