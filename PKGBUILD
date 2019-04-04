# Maintainer: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=2.6.3
pkgrel=1
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64' 'i686')
url="https://github.com/ifedapoolarewaju/igdm"
license=('MIT')
groups=()
depends=('glibc' 'gtk3' 'nss')
makedepends=()
checkdepends=()
optdepends=()
provides=('igdm')
conflicts=('igdm')
source=("https://raw.githubusercontent.com/ifedapoolarewaju/igdm/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/ifedapoolarewaju/igdm/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb")
source_i686=("${pkgname}-${pkgver}-i686.deb::https://github.com/ifedapoolarewaju/igdm/releases/download/v${pkgver}/IGdm_${pkgver}_i386.deb")
sha256sums=('1777c54d2f39e230ba87a3c793117de156a57fcb38043f16f7a6baadc80b1421')
sha256sums_x86_64=('1e9d2e9898131dadf178142402a56e5393e470c6a00a00b52d0e846bbafab1e9')
sha256sums_i686=('ff5fe9dccca0095a24cb43530da3c9b6acab42098068b1c8ff3af8cd4b8d0509')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
