# Maintainer: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=2.6.4
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
sha256sums_x86_64=('1f0932167b14ce3807fc03393460d8fda0e32b8f26e38505c036b5b730c25870')
sha256sums_i686=('2488e0d44f3417bfc8c18c41d324347baa41c5f635fc8e0799bd62db6907899f')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
