# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=godotjs-v8-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Add TypeScript/JavaScript Support for Godot 4.x with v8 JS Engine"
arch=('x86_64')
url="https://godotjs.github.io"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ialex32x/GodotJS-Build/releases/download/GodotJS_v${pkgver}_Godot_4.3_bundle_1/editor_linux_x64_v8.zip")
noextract=()
sha256sums=("b498849ccffaa5f4a130bad511eaacc1ee0d779ee5261c0ab3cd74573fbf93d9")
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "$srcdir/godot/bin/godot.linuxbsd.editor.dev.x86_64" "$pkgdir/usr/bin/godotjs-v8"
}
