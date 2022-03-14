# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=betterzsh
pkgver=1.0.r7
pkgrel=1
pkgdesc='Configurations to enhance user experience with the ZSH shell.'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(zsh zsh-fast-syntax-highlighting zsh-autosuggestions-git zsh-autopair-git)
optdepends=('starship: Adds very useful git functionality to the terminal')
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  '1714f36bcd073c1d6d51ddd22b4a969918df764496447e025d47d373f7d123ba'
  'c4aadb5189b999b671a761d1f4f396bfa3fadf2efcd669acacc7d20c992a4e42'
  )

package() {
  install -Dm644 usr/share/zsh/plugins/betterzsh.zsh "${pkgdir}/usr/share/zsh/plugins/betterzsh.zsh"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
