# Maintainer: xx777 <zenmchen@gmail.com>

_pkgbase=rtl8xxxu
pkgname=rtl8xxxu-dkms-git
pkgver=git_c8bc376
pkgrel=1
pkgdesc="Driver for Realtek RTL8XXXXU wifi chips"
arch=('x86_64')
url="https://github.com/a5a5aa555oo/rtl8xxxu"
license=('GPL2' 'custom:binary-redist-Realtek-restrictive')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/a5a5aa555oo/rtl8xxxu.git")
sha256sums=('SKIP')

package() {
    cd ${srcdir}/${_pkgbase}
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
}
