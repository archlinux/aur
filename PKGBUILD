# Maintainer: Soul Player Contributors <noreply@github.com>
pkgname=soul-player
pkgver=0.1.14
pkgrel=1
pkgdesc="Modern, privacy-first music player for local audio files"
arch=('x86_64')
url="https://github.com/soulaudio/soul-player"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
source=("${pkgname}-${pkgver}.deb::https://github.com/soulaudio/soul-player/releases/download/v${pkgver}/Soul.Player_${pkgver}_amd64.deb")
sha256sums=('ec052f891778d2d2a12d118fb70305b4a11082b25638a519d402677c2a13d67f')

package() {
    # Extract DEB package
    tar -xf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
