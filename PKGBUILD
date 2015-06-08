# Maintainer: Xavier Wirth <xavier.wirth@telecomnancy.eu>
# Contributor: Clément Guérin <geecko.dev@free.fr>
# I used the mspgcc-gcc-bin from Clément Guérin as template

pkgname=mspgcc-mcu-bin
pkgver=20120406
pkgrel=1
pkgdesc="Spec files, headers and linker scripts for TI's MSP430 targets"
arch=('any')
url="https://launchpad.net/ubuntu/+source/msp430mcu"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('mspgcc-mcu')
conflicts=('mspgcc-mcu')
replaces=()
backup=()
options=('libtool' 'staticlibs' '!strip')
install=
changelog=
source=("https://launchpad.net/ubuntu/+archive/primary/+files/msp430mcu_20120406-2_all.deb")
noextract=()
md5sums=('9d9485684954c803654ecbe3856a8949')

package() {
  tar xzf ${srcdir}/data.tar.gz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -r "${pkgdir}"/{usr/share/doc,usr/share/lintian}
}

