# Maintainer: mistgc <georgecai0908@outlook.com>
pkgname=marker-md
pkgver=1.3.0
pkgrel=1
pkgdesc="A Desktop App for Easily Viewing and Editing Markdown Files."
arch=('x86_64')
url="https://marker.pages.dev"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
source=(
    "https://github.com/tk04/Marker/releases/download/master/marker_${pkgver}_amd64.deb"
)
sha512sums=('1262bc9f771700f967046ac5878409ca9964de808a4ca383723fc29373a89ba380e556e56e8590e672df594361d58f4073fb34850429e14f7df8c544ea5a0fc7')

prepare() {
    tar -xpf data.tar.gz -C ${srcdir}
}

package() {
    cd ${srcdir}
    cp -r usr ${pkgdir}
}
