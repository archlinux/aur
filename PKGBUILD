# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Pokemod97 cadenkline9@gmail.com
# Maintainer: Qyriad qyriad@gmail.com
pkgname=libtransistor-bin
pkgver=v2.1.1
pkgrel=1
epoch=
pkgdesc="Nintendo Switch homebrew toolchain"
arch=('any')
url="https://github.com/reswitched/libtransistor"
license=('ISC')
groups=('base-devel')
depends=('clang'
'lld'
'squashfs-tools'
'python-pyelftools'
'python-lz4')
provides=("libtransistor")
conflicts=("libtransistor-git")
replaces=()
backup=()
options=(!'strip')
install=libtransistor-bin.install
source=("https://github.com/reswitched/libtransistor/releases/download/$pkgver/libtransistor_${pkgver}.tar.gz")
md5sums=('ad490814b14a099cc42c5d6aa4e2110a')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/opt/libtransistor"
	cp -r * "$pkgdir/opt/libtransistor"

}



