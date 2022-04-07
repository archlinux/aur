# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=betterzsh
pkgver=1.0.r7
pkgrel=1
pkgdesc='Configurations to enhance user experience with the ZSH shell.'
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(zsh zsh-fast-syntax-highlighting zsh-autosuggestions-git zsh-autopair-git)
optdepends=('starship: Adds very useful git functionality to the terminal')
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('318e427165aeccadda34141bbde73470229378b7da86a8d46f286f57f54ac0a8')

package() {
  install -Dm644 usr/share/zsh/plugins/betterzsh.zsh "${pkgdir}/usr/share/zsh/plugins/betterzsh.zsh"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
