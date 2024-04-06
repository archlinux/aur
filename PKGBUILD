# Maintainer: mistgc <georgecai0908@outlook.com>
pkgname=marker-tauri
pkgver=1.2.0
pkgrel=1
pkgdesc="A Desktop App for Easily Viewing and Editing Markdown Files."
arch=('x86_64')
url="https://marker.pages.dev"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
source=(
    "https://github.com/tk04/Marker/releases/download/master/marker_${pkgver}_amd64.deb"
)
sha512sums=('44a8f9a3ee869f1bcf976908babf6400c19e8ca97a6916b1b371784dea4ad20bc8259dcb562bb2758609cfdd268e5262ceaf48e84f6ab42bf574154dfabbeca9')

prepare() {
    tar -xpf data.tar.gz -C ${srcdir}
}

package() {
    cd ${srcdir}
    cp -r usr ${pkgdir}
}
