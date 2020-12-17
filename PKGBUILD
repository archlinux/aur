# Maintainer: Grega Vrbančič <grega.vrbancic@gmail.com>

pkgname=libxalan-c111
pkgver=1.11
pkgrel=1
pkgdesc="XSLT processor library for C++"
arch=('x86_64')
url="https://xalan.apache.org/xalan-c/"
license=('Apache-2.0')
depends=('glibc' 'xerces-c')
makedepends=()
provides=()
source=(http://si.mirror.kumi.systems/ubuntu/pool/universe/x/xalan/${pkgname}_${pkgver}-6ubuntu3_amd64.deb)
sha256sums=('b354e41f938c2b3181f99671c788493a66d0059efb996666c246281da21c4371')

package() {
    mkdir -p $pkgdir/usr/lib/
    mkdir -p $pkgdir/usr/share
    tar -xf "${srcdir}/data.tar.xz"
    cp -r "${srcdir}/usr/lib/x86_64-linux-gnu/libxalan-c.so.111.0" "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/lib/x86_64-linux-gnu/libxalan-c.so.111" "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/lib/x86_64-linux-gnu/libxalanMsg.so.111.0" "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/lib/x86_64-linux-gnu/libxalanMsg.so.111" "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
}