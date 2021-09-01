# Maintainer: Emil Blennow <mr.emil101@gmail.com>
pkgname=zsh-fish
pkgver=1
pkgrel=1
epoch=
pkgdesc="Configure zsh to be like fish"
arch=(x86_64)
license=('GPL')
depends=(zsh
         zsh-completions
	 zsh-autosuggestions
	 zsh-syntax-highlighting)
checkdepends=()
optdepends=('grml-zsh-config: nice defaults')
install=zsh-fish.install
source=('zsh-fish.zsh')
noextract=('zsh-fish.zsh')
sha256sums=('c4e88f2aeca90b20b66e48c7548d85186b707685feeffcf1c11cbb8cba493152')

package() {
	install -D -m644 zsh-fish.zsh "$pkgdir/usr/share/zsh/plugins/zsh-fish.zsh"
}
