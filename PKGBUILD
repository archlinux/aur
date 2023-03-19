# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(chatgpt-shell-cli)
conflicts=(chatgpt-shell-cli-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url#commit=e47853176d2cc36602ca04507fd3b5525f623737")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
   # Add it to /usr/local/bin to make it executable
   cd "${srcdir}"/chatGPT-shell-cli
   sudo cp "${srcdir}"/chatGPT-shell-cli/chatgpt.sh /usr/local/bin/chatgpt
}
