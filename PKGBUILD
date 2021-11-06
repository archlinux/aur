# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=findex
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Highly customizable finder with high performance. Written in Rust and uses GTK"
arch=("x86_64")
url="https://github.com/mdgaziur/findex"
license=('GPL3')
groups=()
depends=("gtk3")
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
source=("https://github.com/mdgaziur/findex/releases/download/v0.2.0/findex"
	"https://github.com/mdgaziur/findex/releases/download/v0.2.0/style.css"
	"https://github.com/mdgaziur/findex/releases/download/v0.2.0/LICENSE")
noextract=()
md5sums=('e0cd1edb948877228b563e4623759a3e'
         'f0bc2115197f5ce9a118d4648cc6683b'
         '1ebbd3e34237af26da5dc08a4e440464')
validpgpkeys=()

package() {
	cd ..
	install -Dm755 findex ${pkgdir}/usr/bin/findex
	mkdir -p ${pkgdir}/opt/findex
	cp style.css ${pkgdir}/opt/findex
	install -Dm644 LICENSE ${pkgdir}/usr/licenses/findex/LICENSE
}
