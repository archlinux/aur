# Maintainer: Beethoven <beethovenisadog@protonmail.com>
pkgname=grg-git
pkgver=v1.0.0
pkgrel=1
pkgdesc="grg - a TUI for git repos"
url="https://gitlab.com/beethoven__/grg/"
license=('MIT')
depends=('bash' 'bat')
provides=('grg')
makedepends=('git')
optdepends=('ranger: compatible file manager'
						'joshuto: compatible file manager'
						'neovim: you want a text editor of some kind for this')
source=("git+https://gitlab.com/beethoven__/grg.git")
md5sums=('SKIP')
arch=('any')

package() {
	cd "$srcdir/grg"
	install -Dm755 grg "$pkgdir/usr/bin/grg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/grg/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/grg/README.md"
}
