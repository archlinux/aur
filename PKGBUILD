# Maintainer: Simon <contact at swz dot works>
pkgname=neovide-lunarvim
pkgver=0.1.0
pkgrel=1
pkgdesc="neovide binary and .desktop file that launches with lunarvim"
arch=("x86_64")
url="https://github.com/neovide/neovide"
conflicts=()

depends=("neovide")
optdepends=("lunarvim-git: if not installed with shell script")

license=("custom")

source=("neovide-lunarvim.desktop" "script.sh")
sha512sums=(SKIP SKIP)

package() {
  bindir="~/.local/bin"
  install -Dm755 "script.sh" "${pkgdir}/$HOME/.local/bin/${pkgname}"
  install -Dm755 "${pkgname}.desktop" "${pkgdir}/$HOME/.local/share/applications/${pkgname}.desktop"
}
