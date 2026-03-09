# Maintainer: Soul Player Contributors <noreply@github.com>
pkgname=soul-player
pkgver=0.1.15
pkgrel=1
pkgdesc="Modern, privacy-first music player for local audio files"
arch=('x86_64')
url="https://github.com/soulaudio/soul-player"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
source=("${pkgname}-${pkgver}.deb::https://github.com/soulaudio/soul-player/releases/download/v${pkgver}/Soul.Player_${pkgver}_amd64.deb")
sha256sums=('fb14f77a582ab2df48c8b9bfca42e002bd16196d3f9294c6bf9c794631535214')

package() {
    # Extract DEB package
    tar -xf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
