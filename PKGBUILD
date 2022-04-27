# Maintainer: Ruslan Sergin <ruslan.sergin@gmail.com>
pkgname=arcolinux-logout
pkgver=22.03_01
pkgrel=2
pkgdesc="Beautiflul ArcoLinux logout screen"
url="https://github.com/arcolinux/arcolinux-logout"
arch=('x86_64')
depends=('python3' 'python-cairo')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arcolinux/arcolinux-logout/archive/refs/tags/${pkgver//_/-}.tar.gz")
md5sums=('d0efdcf0e23df5ab2bdcde6944472772')

package () {
    mkdir -p "${pkgdir}" 
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/"{usr,etc} "${pkgdir}/"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/arcologout"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/arcologout"
}

