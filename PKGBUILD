# Maintainer: Xavier Wirth <xavier.wirth@telecomnancy.eu>
# Contributor: Clément Guérin <geecko.dev@free.fr>
# I used the mspgcc-gcc-bin from Clément Guérin as template

pkgname=mspgcc-gdb-bin
pkgver=20111205
pkgrel=1
pkgdesc="GNU C debugger (for MSP430)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/gdb-msp430"
license=('GPL')
groups=()
depends=('mspgcc-binutils-bin')
makedepends=()
optdepends=()
provides=('mspgcc-gdb')
conflicts=('mspgcc-gdb')
replaces=()
backup=()
options=('libtool' 'staticlibs' '!strip')
install=
changelog=
source_x86_64=('https://launchpad.net/ubuntu/+archive/primary/+files/gdb-msp430_7.2a%7Emspgcc-20111205-3ubuntu1_amd64.deb')
source_i686=('https://launchpad.net/ubuntu/+archive/primary/+files/gdb-msp430_7.2a%7Emspgcc-20111205-3ubuntu1_i386.deb')
noextract=()
md5sums_i686=('cdbb15edabd9f58da99ac38715c59951')
md5sums_x86_64=('eccee842162c4a56127d2c1477528132')

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -r "${pkgdir}/usr/share/doc"
}

