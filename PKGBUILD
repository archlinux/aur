# Maintainer: notizblock: nblock [/at\] archlinux DOT us

pkgname=mtkbabel
pkgver=0.8.3.1
pkgrel=1
pkgdesc="Operation software for GPS devices based on the MediaTek MTK chipset"
arch=('i686' 'x86_64')
url="http://mtkbabel.sourceforge.net"
license=('GPL2')
depends=('perl' 'perl-device-serialport' 'perl-timedate')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('eda7a0e00cae84cc307066e413e94e45')

build() {
  cd "${srcdir}/${pkgver}"
  
  install -dm755 ${pkgdir}/usr/bin
  install -dm644 ${pkgdir}/usr/share/${pkgname}
  install -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -m755 MtkExtensionsv1.xsd  ${pkgdir}/usr/share/${pkgname}/MtkExtensionsv1.xsd
  install -Dm644 ${pkgname}.1  ${pkgdir}/usr/share/man/man1/${pkgname}.1
}

# vim:set ts=2 sw=2 et:
