# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-bin
# Replaced by the release workflow before publishing to AUR.
pkgver=0.6.2
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
sha256sums=('84f9d1322f58e140c18819860276d7c556b9ca8ec7a26a00a4fef4429366bd89')

package() {
    install -Dm755 "${srcdir}/sculk-${pkgver}" "${pkgdir}/usr/bin/sculk"
}
