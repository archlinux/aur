# Maintainer: Heptazhou <heptazhou at icloud dot com>

pkgname=conda-zsh-completion
pkgver=0.9
pkgrel=3
pkgdesc="zsh completion for conda"
arch=("any")
url="https://github.com/esc/conda-zsh-completion"
license=("custom:WTFPL")
depends=("zsh" "zsh-completions")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/esc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("beb79bfe083551628cad3fe6bb6e39cd638c1c44f83a3c9c7f251ec4d20b5ade")

package() {
	install -dm755 "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 $srcdir/$pkgname-*/_* "$pkgdir/usr/share/zsh/site-functions"
	# license
	install -Dm644 $srcdir/$pkgname-*/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
