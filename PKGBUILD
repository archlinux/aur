# Maintainer: Soul Player Contributors <noreply@github.com>
pkgname=soul-player
pkgver=0.1.18
pkgrel=1
pkgdesc="Modern, privacy-first music player for local audio files"
arch=('x86_64')
url="https://github.com/soulaudio/soul-player"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
source=("${pkgname}-${pkgver}.deb::https://github.com/soulaudio/soul-player/releases/download/v${pkgver}/Soul.Player_${pkgver}_amd64.deb")
sha256sums=('3aeb922221094ce94f7c8726a5d79f01946f6cd0ceb9a5f867c280a2c3f11e4d')

package() {
    # Extract DEB package
    tar -xf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
