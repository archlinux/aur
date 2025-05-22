# Maintainer: Marcel B <irpd6s1qp@mozmail.com>
pkgname=fsfrpc
pkgver=1.1.0
pkgrel=1
pkgdesc="Shows your proprietary package count in Discord Rich Presence"
license=('GPL')
arch=('any')
url="https://github.com/its-mrarsikk/fsfrpc"
depends=("python" "python-pypresence" "absolutely-proprietary")
source=("fsfrpc.py" "fsfrpc.1")
sha256sums=('79b3e22b650f54a2e328ceb5a524d5dae8b4a6a2aa430f5759aa9942ab0c72e2'
            'a15ac26a4796aec56ac8773c5b5c677da39d52ecdf9a05405a5cbff0ae972ff5')

package() {
	install -Dm755 "$srcdir/fsfrpc.py" "$pkgdir/usr/bin/fsfrpc"
    install -Dm644 fsfrpc.1 "$pkgdir/usr/share/man/man1/fsfrpc.1"
}
