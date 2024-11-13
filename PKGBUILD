# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: Ruslan Sergin <ruslan.sergin@gmail.com>
pkgname=arcolinux-logout
pkgver=24.04_01
pkgrel=2
pkgdesc="Beautiflul ArcoLinux logout screen"
url="https://github.com/arcolinux/arcolinux-logout"
arch=('x86_64')
depends=('python3' 'python-cairo' 'python-distro' 'python-gobject' 'libwnck3')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arcolinux/arcolinux-logout/archive/refs/tags/${pkgver//_/-}.tar.gz")
md5sums=('30433a961d028fa3aa7fae3f9fbed5a2')

package () {
    mkdir -p "${pkgdir}" 
    mv "${srcdir}/archlinux-logout-${pkgver//_/-}/"{usr,etc} "${pkgdir}/"
    mv "${srcdir}/archlinux-logout-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/arcologout"
    mv "${srcdir}/archlinux-logout-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/arcologout"
    # mv "${srcdir}/${pkgname}-${pkgver//_/-}/"{usr,etc} "${pkgdir}/"
    # mv "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/arcologout"
    # mv "${srcdir}/${pkgname}-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/arcologout"
}

