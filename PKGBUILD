# Maintainer: Soul Player Contributors <noreply@github.com>
pkgname=soul-player
pkgver=0.1.7
pkgrel=1
pkgdesc="Modern, privacy-first music player for local audio files"
arch=('x86_64')
url="https://github.com/soulaudio/soul-player"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
source=("${pkgname}-${pkgver}.deb::https://github.com/soulaudio/soul-player/releases/download/v${pkgver}/Soul.Player_${pkgver}_amd64.deb")
sha256sums=('a1e017b6d3218fd69201219a610b83af8eaafd6fc29b2d409cb58e9bce77ab91')

package() {
    # Extract DEB package
    tar -xf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
