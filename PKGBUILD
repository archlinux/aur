# Maintainer: Emilio Toledo <archlinux@emiliotoledo.me>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=gitflow-cjs
pkgver=2.2.1
pkgrel=1
pkgdesc="CJS Edition of the git extensions to provide high-level repository operations for Vincent Driessen's branching model."
arch=("any")
url="https://github.com/CJ-Systems/gitflow-cjs"
license=("LGPL")
depends=("git")
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git' 'gitflow-ahv')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('1cb748e2b677462002e769d3ca39c6a3f2594111b9000567f8de7a2baef0eac949d66a7da7dfbb0fc2bcf62733e0b759f162fe679b8fc02f90fb571f48b86e81')

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr" install
}
