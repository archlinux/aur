# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=proxsign-bin
pkgver=2.2.7
pkgrel=1
_pkgname=proxsign
_pkgver=2.2.7-10.2
pkgdesc="SETCCE proXSign® is a set of components for PKI based digital signing. Package based on the official binary build."
arch=('x86_64')
url="https://www.setcce.com/products/electronic-signature-technologies/pki"
license=('custom: SETCCE')
depends=('cairo' 'libjpeg6-turbo' 'libldap24' 'nss' 'xalan-c' 'xerces-c' 'zlib')
source=(https://proxsign.setcce.si/$_pkgname/repo/Fedora_34/x86_64/$_pkgname-$_pkgver.x86_64.rpm)
sha256sums=('af09f57241ebfb98454426908046eadbef479a6c34a2d4cdab12da0675e0cfac')

package() {
    install -Dm755 ${srcdir}/usr/bin/proxsign ${pkgdir}/usr/bin/proxsign
    install -Dm644 ${srcdir}/etc/proxsign.ini ${pkgdir}/etc/proxsign.ini
    install -Dm644 ${srcdir}/usr/lib64/libpxs-podofo.so ${pkgdir}/usr/lib/libpxs-podofo.so
    install -Dm755 ${srcdir}/usr/lib64/libpxs-podofo.so.0.9.7 ${pkgdir}/usr/lib/libpxs-podofo.so.0.9.7
    install -Dm644 ${srcdir}/usr/share/applications/proxsign.desktop ${pkgdir}/usr/share/applications/proxsign.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/proXSign.svg
}
