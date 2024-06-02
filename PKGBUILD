# Maintainer: mistgc <georgecai0908@outlook.com>
pkgname=marker-md
pkgver=1.4.0
pkgrel=1
pkgdesc="A Desktop App for Easily Viewing and Editing Markdown Files."
arch=('x86_64')
url="https://marker.pages.dev"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
source=(
    "https://github.com/tk04/Marker/releases/download/master/marker_${pkgver}_amd64.deb"
)

sha512sums=('1095d2b047cb6279bb9b7e6788fa43581c82b064975fb8d866f953cb83a44935450637565df7aacb4746629592ef1440e4ff269f0e595c95177f3ca359a8b57f')

prepare() {
    tar -xpf data.tar.gz -C ${srcdir}
}

package() {
    cd ${srcdir}
    cp -r usr ${pkgdir}
}
