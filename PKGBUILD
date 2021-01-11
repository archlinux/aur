# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=85.0
pkgrel=2
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/epel8/iridium-browser-2020.11.85-1.el8.x86_64.rpm')

sha256sums=('4af2f18d115718742597d8079504dd8e18257819a0ecf6b9722b1cff6ae144d7')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
)
