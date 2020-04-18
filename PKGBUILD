# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>
# Contributors:

pkgname=iridium-rpm
pkgver=81.0
pkgrel=1
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
conflicts=('iridium-deb')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/epel8/iridium-browser-2020.04.81-1.el8.x86_64.rpm')

sha256sums=('aa55f85a3fd8dee875844920b56078623941fdbbee8120823d6fd3275cfde526')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
)
