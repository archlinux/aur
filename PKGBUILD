# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato ay nyan dot eu dot org>
pkgname=llama-app-bin
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="a simple app to use LLaMa language models on your computer, built with rust, llama-rs, tauri and vite."
arch=(x86_64)
url="https://github.com/karelnagel/llama-app/"
license=('MIT')
groups=()
depends=(hicolor-icon-theme cairo gdk-pixbuf2 glib2 webkit2gtk gtk3 glibc gcc-libs openssl-1.1)
makedepends=()
checkdepends=()
optdepends=()
provides=(l-la-ma)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/karelnagel/llama-app/releases/download/app-v${pkgver}/l-la-ma_0.0.0_amd64.deb")
noextract=()
sha256sums=('c0276c7061d96bbc50926bdac10fa8708dc6a3df444e45381332727b1f298b1a')
validpgpkeys=()

package() {
	tar -xvpf data.tar.gz -C "$pkgdir"
	chown -R root:root $pkgdir
}
