# Maintainer: Marco Melletti <melletti.marco@gmail.com>
pkgname=uarm
pkgver=1.1.0
pkgrel=1
pkgdesc="arm7tdmi based computer emulator with debugging tools"
arch=('x86_64')
url="http://mellotanica.github.io/uARM/"
license=('GPL')
conflicts=('uarm-git')
depends=('qt5-declarative' 'boost')
optdepends=('python2: for uarm-readuarm header reader' 'arm-none-eabi-gcc: cross compiler for target architecture')
backup=('etc/default/uarm')
install=
source=('https://github.com/mellotanica/uARM/releases/download/v1.1.0/uarm-1.1.0-x86_64_prebuilt.tar.gz')
md5sums=('21a92551c29197eedcdf161298d40b02')

_bindir='uarm'

package() {
	cd "$_bindir"
	./install.sh -b "$pkgdir"
}
