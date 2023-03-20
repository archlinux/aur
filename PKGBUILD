# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli-git
pkgver=1.0.r3.91f1b13
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
provides=(chatgpt-shell-cli-git)
conflicts=(chatgpt-shell-cli)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"
}
