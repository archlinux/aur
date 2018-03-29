# Maintainer: zenekron <zenekron@gmail.com>
pkgname=konsole-dracula-git
pkgver=1
pkgrel=2
pkgdesc="Dracula theme for konsole"
arch=("any")
url="https://draculatheme.com/konsole/"
license=("MIT")
depends=("konsole")
makedepends=("git")
provides=("konsole-dracula")
conflicts=("konsole-dracula")
source=("$pkgname::git+https://github.com/dracula/konsole")
md5sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"
	install -Dm 644 "Dracula.colorscheme" "$pkgdir/usr/share/konsole/Dracula.colorscheme"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

