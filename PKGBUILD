# Maintainer: Ruslan Sergin <ruslan.sergin@gmail.com>
pkgname=arcolinux-logout
pkgver=21.07_02
pkgrel=1
pkgdesc="Beautiflul ArcoLinux logout screen"
url="https://github.com/arcolinux/arcolinux-logout"
arch=('x86_64')
depends=('python3' 'python-cairo')
license=('GPLv3')
source=("$pkgname::https://github.com/arcolinux/arcolinux-logout/archive/refs/tags/${pkgver//_/-}.tar.gz")
md5sums=('23d72b9ccd59689b4c47c07b416a7344')

package () {
    mkdir -p "${pkgdir}" 
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/"{usr,etc} "${pkgdir}/"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/arcologout"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/arcologout"
}

