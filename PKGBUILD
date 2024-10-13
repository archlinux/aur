# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daudi Wampamba <me@daudi.dev>
pkgname=linux-enable-ir-emitter-bin
pkgver=6.0.6
pkgrel=1
epoch=
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
groups=()
depends=('fmt'
    'gtk3'
    'opencv'
    'python'
    'qt6-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(
	'chicony-ir-toggle'
	'linux-enable-ir-emitter'
	'linux-enable-ir-emitter-git'
)
replaces=()
backup=()
options=()
install=
changelog=
source=("linux-enable-ir-emitter-$pkgver.systemd.x86-64.tar.gz::https://github.com/EmixamPP/linux-enable-ir-emitter/releases/download/$pkgver/linux-enable-ir-emitter-$pkgver.systemd.x86-64.tar.gz")
noextract=()
md5sums=('508765419da44f0de6fe2d1fc63f1c08')
validpgpkeys=()

package() {
	tar -C $pkgdir --no-same-owner -h -xzf linux-enable-ir-emitter-$pkgver.systemd.x86-64.tar.gz
}
