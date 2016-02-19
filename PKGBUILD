# Maintainer: Marco Melletti <melletti.marco@gmail.com>
pkgname=uarm
pkgver=1.0
pkgrel=1
pkgdesc="arm7tdmi based computer emulator with debugging tools"
arch=('x86_64')
url="http://mellotanica.github.io/uARM/"
license=('GPL')
depends=('qt5-declarative' 'boost')
optdepends=('python2: for uarm-readuarm header reader' 'arm-none-eabi-gcc: cross compiler for target architecture')
backup=('etc/default/uarm')
install=
source=('https://github.com/mellotanica/uARM/releases/download/v$pkgver/uarm-$pkgver-x86_64_prebuilt.tar.gz')
md5sums=('cf7342633ee11ccc7718ca36cc079b70')

_bindir='uarm'

package() {
	cd "$_bindir"
	./install.sh -b "$pkgdir"
}
