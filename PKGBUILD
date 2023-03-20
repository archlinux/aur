# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
groups=()
depends=(jq curl)
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
   install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"
}
