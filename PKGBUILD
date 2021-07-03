# Maintainer: Nathan Kolpa <nathan@kolpa.me>
pkgname=xmonad-recompile-hook-git
pkgver=1.2
pkgrel=1
pkgdesc="This hook recompiles xmonad when necessary, to prevent errors after restarting"
arch=('any')
url="https://github.com/NathanKolpa/xmonad-recompile-hook.git"
license=('GPL')
depends=(xmonad)
makedepends=(git)
options=()
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "xmonad-recompile-hook"
	mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
	cp xmonad-recompile.hook "$pkgdir/usr/share/libalpm/hooks/xmonad-recompile.hook"
}
