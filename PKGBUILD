# Maintainer: Emil Blennow <mr.emil101@gmail.com>
pkgname=zsh-fish
pkgver=2
pkgrel=1
epoch=
pkgdesc="Configure zsh to be like fish"
arch=(x86_64)
license=('GPL')
depends=(zsh
         zsh-completions
	 zsh-autosuggestions
	 zsh-fast-syntax-highlighting)
checkdepends=()
optdepends=('grml-zsh-config: nice defaults')
install=zsh-fish.install
source=('zsh-fish.zsh')
noextract=('zsh-fish.zsh')
sha256sums=('ed7759f913b4dfe5a1eae87e0c503c27a39e7d48586907c3c478215c2c7e1e06')

package() {
	install -D -m644 zsh-fish.zsh "$pkgdir/usr/share/zsh/plugins/zsh-fish.zsh"
}
