# Maintainer: Ruslan Sergin <ruslan.sergin@gmail.com>
pkgname=arcolinux-logout
pkgver=22.05_27
pkgrel=1
pkgdesc="Beautiflul ArcoLinux logout screen"
url="https://github.com/arcolinux/arcolinux-logout"
arch=('x86_64')
depends=('python3' 'python-cairo')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arcolinux/arcolinux-logout/archive/refs/tags/${pkgver//_/-}.tar.gz")
md5sums=('7508e76f8977698a068634f3c5ff34d3')

package () {
    mkdir -p "${pkgdir}" 
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/"{usr,etc} "${pkgdir}/"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/arcologout"
    mv "${srcdir}/${pkgname}-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/arcologout"
}

