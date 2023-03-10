# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=open-ai-translator-bin
pkgver=0.0.16
pkgrel=1
epoch=
pkgdesc="Cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/yetone/openai-translator"
license=('MIT')
groups=()
depends=(webkit2gtk gtk3)
makedepends=()
checkdepends=()
optdepends=()
provides=(open-ai-translator)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yetone/openai-translator/releases/download/v$pkgver/open-ai-translator_${pkgver}_amd64.deb")
noextract=()
sha256sums=('d49ac8bb0e5c280fab9d9de28fcc14dfd63a1ad00593c4ea9a5398510a22378a')
validpgpkeys=()

package() {
		tar -xvpf data.tar.gz -C $pkgdir
}
