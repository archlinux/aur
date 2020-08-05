# Maintainer: Grega Vrbančič <grega.vrbancic@gmail.com>

pkgname=proxsign
pkgver=2.1.5
_pkgver=2.1.5-32.1
pkgrel=1
pkgdesc="SETCCE proXSign® for Linux is a full featured set of components for PKI based digital signing. Package based on the official rpm build."
arch=('x86_64')
url="https://www.setcce.com/products/electronic-signature-technologies/pki"
license=('custom: SETCCE')
depends=('libjpeg6-turbo' 'boost1.69-libs' 'xalan-c=1:1.11-3' 'glibc' 'cairo' 'xerces-c' 'zlib' 'nss')
makedepends=()
provides=()
source=(https://proxsign.setcce.si/$pkgname/repo/Fedora_32/x86_64/$pkgname-$_pkgver.x86_64.rpm)
sha256sums=('ede19699594156d316ea91df01b5ea43c1efa967882e2b6e94b6c41bf7c9fccb')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
}
