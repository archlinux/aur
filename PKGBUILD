# Maintainer: Kunal Singh <kunalsin9h@gmail.com>
pkgname='commit' # name of the pacakge
pkgver=0.1.0 # version of the application
pkgrel=1 # version of the backage
#epoch=1 # the newest package, next time set epoch to 2 (this is to ensure that this is the latest package, it default pkg ver comparsion not working)
pkgdesc="Git commit simulator using Conventional Commits conventions"
arch=('x86_64')
url="https://github.com/KunalSin9h/commit.git"
license=('MIT')
depends=('gum') # Runtime dependency
makedepends=('git') # build time dependency
source=(git+https://github.com/KunalSin9h/commit.git)
md5sums=('SKIP')

package() {
	cd "$pkgname"
    install -Dm755 "commit" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
