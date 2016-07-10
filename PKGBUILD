# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=moeditor-bin
pkgver=0.0.1_alpha
pkgrel=1
epoch=
pkgdesc="All-purpose markdown editor based on Electrum"
arch=('x86_64')
url="https://github.com/Moeditor/Moeditor"
license=('GPL3')
groups=()
depends=('gtk2' 'libxss' 'libxtst' 'alsa-lib' 'nss' 'gconf')
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
source=("https://github.com/Moeditor/Moeditor/releases/download/v0.0.1-alpha/Moeditor-0.0.1-linux-x64.7z")
noextract=()
md5sums=('fe7e9970563f8bfd3e358f5893bdb41a')
sha512sums=('696c91e7dbba2311ba3944cf93c4a3763d6d9a4fb0d5dd74b7fd4733964c272f338398ce00dcf2dcfe73cc906b1be9a914359ac4a4c1547e016912888efd4afe')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr"
	cp -r "$srcdir/usr/" "$pkgdir/"
}
