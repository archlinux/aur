# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>
# Contributors:

pkgname=iridium-rpm
pkgver=80.0
pkgrel=1
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
conflicts=('iridium-deb')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/epel8/iridium-browser-2020.02.80-1.el8.x86_64.rpm')

sha256sums=('bfcb4f792cd933e8357771af6a73d35691b16037e610131822ad75f625d04ec9')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
)
