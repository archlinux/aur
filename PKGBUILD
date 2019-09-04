# Maintainer: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=2.7.0
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
sha256sums_x86_64=('faa1ccd5f0548dd5fbc3e94d8308561fa3b557dd302a1621109a9856ae425926')
sha256sums_i686=('9b993e23c72abed70820ff78d00eaeb767aa5620f74cefb903c3d39e3b3230dc')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
