# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Pokemod97 cadenkline9@gmail.com
pkgname=libtransistor-bin
pkgver=v1.2.2
pkgrel=1
epoch=
pkgdesc="Nintendo Switch homebrew toolchain"
arch=('x86_64')
url="https://github.com/reswitched/libtransistor"
license=('ISC')
groups=('base-devel')
depends=('clang'
'lld'
'squashfs-tools'
'python-elftools'
'python-lz4')
makedepends=('git'
'cmake')
provides=("libtransistor")
conflicts=("libtransistor-git")
replaces=()
backup=()
options=(!'strip')
install=libtransistor-bin.install
source=("https://github.com/reswitched/libtransistor/releases/download/$pkgver/libtransistor_${pkgver}.tar.gz")
md5sums=('fc362c1ad0ca99a18e964ab7da7b44f5')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/opt/libtransistor"
	cp -r * "$pkgdir/opt/libtransistor"

}



