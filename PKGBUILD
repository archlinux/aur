# Maintainer: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=2.8.1
pkgrel=1
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64' 'i686')
url="https://github.com/ifedapoolarewaju/igdm"
license=('MIT')
groups=()
depends=('gconf' 'glibc' 'gtk3' 'nss')
makedepends=()
checkdepends=()
optdepends=()
provides=('igdm')
conflicts=('igdm')
source=("https://raw.githubusercontent.com/ifedapoolarewaju/igdm/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/ifedapoolarewaju/igdm/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb")
source_i686=("${pkgname}-${pkgver}-i686.deb::https://github.com/ifedapoolarewaju/igdm/releases/download/v${pkgver}/IGdm_${pkgver}_i386.deb")
sha256sums=('1777c54d2f39e230ba87a3c793117de156a57fcb38043f16f7a6baadc80b1421')
sha256sums_x86_64=('0be63f6d8008cd9640d65cdb77b3c0fec9d3eb342be6303f244a641613d977b9')
sha256sums_i686=('44f47bbc6bd83e948f7e59851638c65be2edc01ae881f32b1a7d024071bee042')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
