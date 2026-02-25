# Maintainer: Soul Player Contributors <noreply@github.com>
pkgname=soul-player
pkgver=0.1.11
pkgrel=1
pkgdesc="Modern, privacy-first music player for local audio files"
arch=('x86_64')
url="https://github.com/soulaudio/soul-player"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
source=("${pkgname}-${pkgver}.deb::https://github.com/soulaudio/soul-player/releases/download/v${pkgver}/Soul.Player_${pkgver}_amd64.deb")
sha256sums=('519bb15c01d299f1b5fde4b4059065bb6ee435b5b2778be352509f22c4a45314')

package() {
    # Extract DEB package
    tar -xf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
