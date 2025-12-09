# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=nota.zsh
pkgver=1.0.0
pkgrel=1
pkgdesc='ZSH plugin that help you record notas with some context.'
arch=('any')
url="https://github.com/0x61nas/nota.zsh"
license=('MIT')
depends=('zsh' 'fzf')
optdepends=()
options=()
source=("https://github.com/0x61nas/$pkgname/archive/refs/tags/$pkgname_$pkgver.tar.gz")
sha256sums=('4098e73a0c5d3fb27b4fbd7003657a74002926d175636cc87e45135a940af0bc')
# validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 nota.zsh "$pkgdir/usr/share/zsh/plugins/nota/nota.zsh"
}
