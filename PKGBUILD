# Maintainer: Emilio Toledo <archlinux@emiliotoledo.me>
pkgname=gitflow-cjs
pkgver=2.2.0
pkgrel=2
pkgdesc="CJS Edition of the git extensions to provide high-level repository operations for Vincent Driessen's branching model."
arch=("any")
url="https://github.com/CJ-Systems/gitflow-cjs"
license=("LGPL")
depends=("git")
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git' 'gitflow-ahv')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("6ce37ccb2587c46fd2b5c7146cfac3d1c7d7aa84295f5a674c32cc42dde3aeaf124a269a1f1debc3272c80bff4677aed0899e2edae23b2d5db96fdc4c6602b72")

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr" install
}