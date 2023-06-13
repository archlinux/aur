# Maintainer: Nathan Kolpa <nathan@kolpa.me>
pkgname=xmonad-recompile-hook-git
pkgver=1.2.3
pkgrel=1
pkgdesc="Recompile xmonad after package updates"
arch=('any')
url="https://github.com/NathanKolpa/xmonad-recompile-hook.git"
license=('GPL')
depends=(xmonad)
makedepends=(git)
options=()
source=("xmonad-recompile-hook::git+$url")
sha256sums=('SKIP')

package() {
	cd "xmonad-recompile-hook"
	mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
	cp xmonad-recompile.hook "$pkgdir/usr/share/libalpm/hooks/xmonad-recompile.hook"
}
