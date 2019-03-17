# Maintainer: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=2.6.2
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
sha256sums_x86_64=('e17fb011dcc47fcd6aa5e1100c7306704eede5366f2ffdaaabca927637f9df92')
sha256sums_i686=('fe3b49fe584e8239cdb35cd91ff4e604567a7343d10800b9369a8c74844de1d8')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
